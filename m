Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F798C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=; b=PioD5zs78IuIrDM8yphp/Bfh5i
	EFE/QA6Y2YIyargCDX7gOCyKjMTAIGfUeR1V3GjGlgBT4k/hM+SJ3Tfv43ejS85w3boV9YT0Sj6On
	6stDgyd8voMpCBI1mCIYRzPc/2X0OQxMlJ4hVfn3Hrjl+ySjKAyC3q+7ZBV7egPId34RHsaRiPKtA
	JnXl+z6NnGiicFXpQM1V4DQsZWX9huOBdqhkihF9cYE+wG8vQpReaDLeXQVdHUvM8J6ruvQxfBb+j
	0heqG8tq6U0ESXeTE2JYa8ELcFAqLZ7odNcp44h12/ruJQVywxxy941CkjK/EHbe8E30z8Hqj8HXF
	mEWVXWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjoK-0000000AFdW-1JQt;
	Wed, 19 Aug 2026 17:10:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjoH-0000000AFd4-1S4w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:10:42 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-81ff017d420so2321007b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159440; x=1787764240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=GMrEw7y2obVaCkm9YvQMeid6OBnEo/OcOSaU41AsnXpVY4sVDO5R69x/LJ1G/9Qu1D
         0VZVhCmdPh8s/PB2C+3Q3ddIo5l4C2Bq3XZYwmJrpL3Auufc+nza4hN2HsIn34t6g2NS
         591Q+gn9YZv2uZCJlYPK5ONV5u/w0Rb17oaws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159440; x=1787764240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=XJnbp/yiINL2O3xtEgw38s4ERRLc7hLDbs1RM2Oi8q9HxkSCnep9ySXkoVqSpqB6Lj
         ZvJhYGArLSqBSmeaUalDyXIFjhdhgLvlFdUORlTi7snxCSuKuXsoPtC1ZG/EAEcTKSK6
         CewcK34SN6u7u12a/Wd4prFj7eIsGAwxslFVcSdbHtOOQMCcm7Hv0VpuUPWuupxNUuZs
         qFp5V7iPAqEhjPyttOTR3zPN6+LtzVbQX9jquK5MZebgP3F0chPqKPT9bTbubKTlffS5
         Z87bemCLOUOqN9eAkS3Gw98eSJiUkwxQtdvUSfgKS9EVPRUVRxhdSxq3eJVHxFrtolds
         ciQg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1taUTb4UI49kxhhNvxnQyqugio9xkmiqxJRmXws44vRa5l1nYAy+WWhl6QYTRFLoqX5+JCETI+mO/E3RT5mVc@lists.infradead.org
X-Gm-Message-State: AFuF++l9OEstTAOC8ozQAuuQJ8fz+e9iO/jCzoqEuAEu3pDDPNPZOR8+
	he5LII3AaBj2QucMecSK5gSp+JmhGCHXlT/cBcBZwEyUbndrZOtzY9o0fYsFwvbwVb6GL18Qa92
	sEgg=
X-Gm-Gg: AR+sD10pfWXO7FoNeVURE0Yvntq3MufiUDOj5sqOV9now58GN3JYTx+Z0d8BiQH0D3Z
	rvgW+feKE01TCxKqkYvMRG+JJ7627eUoB0BITqr28q6J7OtZinvrmflUTgl6idBPsMoaOLV7UHE
	enVxCetnbGQkwsrGs3XNUPuLUAAy1CU28mj2Sm52V99THmj/cOF+BcoADTCyIec/E74EqpBNe5B
	+aBi02mWIemBmCCx2G7X6iHkRzaZPnSAODqc0z2fg8yMRboosVZ09H3baSFUNGoclGOVkywBSjM
	WaEGxgHYB1IpNEC3brrfLGBd2dpnGVmpBWTQCRIl92f1gmGdSLEr6SBlLLnY1pZ6qRGH5WrlYA/
	YcjkDYG7nAV48fWRkZZnLymBnkLRju5wdi57n9AR1BVW8GqkZvNJbp8F3VhBfz2zAP+JkfesNYH
	VngBmttcCSV3QJr5jHIPfuxxwL+CbfXdSlNdc4G8BeD3dUVrHV6/VoUDQzCfq11LnX2jFBE/Hfk
	1Sba60SFkv16iGRtFCxRHG1ylY6fO8=
X-Received: by 2002:a53:ac83:0:b0:66c:7ea5:ef34 with SMTP id 956f58d0204a3-66cd689f5admr251048d50.9.1787159439931;
        Wed, 19 Aug 2026 10:10:39 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccafd03basm1362856d50.1.2026.08.19.10.10.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:10:39 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so107309e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpavTQJITL08ku45NGITgKeu/UDBNr8KfHGcoffDOojo4H9957xxxK66n/mzAtsWbAVm94axW5ia/d1bs94QaXP@lists.infradead.org
X-Received: by 2002:a05:6102:4449:20b0:76b:2548:560a with SMTP id
 ada2fe7eead31-778f37d8a97mr140907137.16.1787159100271; Wed, 19 Aug 2026
 10:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
In-Reply-To: <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
X-Gm-Features: AcwNN1UtXmY_Pr6A3vg9yN6JPfaZdRsVgtlhCWAfgMFRKlEKan_CTSIL5IjyAS4
Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_101041_422793_B24A5BD5 
X-CRM114-Status: GOOD (  20.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Aug 19, 2026 at 2:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 00:13, Doug Anderson wrote:
> > I did some digging. As far as I can tell:
> >
> > * Nothing in the DeviceTree specification 0.4 [1] mentions that
> > aliases are deprecated.
> >
> > * Nothing in the dt-schema repository [2] causes validation to fail
> > when you use new aliases and there is no "allowlist" of old aliases
> > that are allowed for historical reasons.
> >
> > * There is a single reference in the kernel "Documentation/devicetree"
> > about not using aliases to assign an "instance ID" [3].
>
>
> No. The rule is saying: Do not add instance index properties OR custom
> OF aliases.
>
> Logical "OR" means here that for you this sentence is equal to:
> "Do not add custom OF aliases."

That feels like a stretch. While that interpretation is correct if you
read just that sentence in isolation, in the context of the patch as a
whole it feels clear that the point was that you didn't want aliases
specifically because they were used to assign instance IDs. The
patch's subject is "Document discouraged instance IDs", not "document
that aliases are bad" or even "document a bunch of bad things". The
sentence is also in a paragraph that's all about instance IDs.

While I understand you authored the patch, it still feels hard to read
"all aliases are bad" from it.


-Doug

