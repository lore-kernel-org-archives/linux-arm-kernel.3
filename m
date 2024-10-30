Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCDAD5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZnP8od1AoS68OxrD2EKkqTHcwqcNcZbwTyrj6OQuRU=; b=UgIGb1+HnMV4HHmMMbLDUigYZ/
	Rw39Gzv1gpodk39WtPYargDkpSPv5aNzQVueni//t5bBydECMl3Yq9nL/YWR5SrCdysdsgFtTpKLA
	O8GvXVb4dBhpkRdMKz/FKxIywr365JiwCWE2K1xnViapaUxlgfBNtoYxdbFgRaL2dd4Wv/foPf8MO
	zxGtcT2gbtpzCzTAblhkZya6Fa7BakKDk3te6yWHE/3m0otg6C8aOpIEXmhMOa0ajfBpovwq+AwrO
	dFGGQd7AvFSsRvqplsLhTsZyC6vX+2FWp1kZTZWEQw7/V8nERVevn619YKTea/5vhuaADsc7Lwtq8
	3SFejyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67DS-00000000DT8-2i3G;
	Wed, 30 Oct 2024 11:50:22 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66vs-000000009JN-3qBn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:32:14 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5ebc22e6362so3128641eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287932; x=1730892732; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZnP8od1AoS68OxrD2EKkqTHcwqcNcZbwTyrj6OQuRU=;
        b=x/nDP1TE/uwoCtdypb+jaCwZ4ERpX1KSAvzHY4c/rWyhgLXXZAbCnL5kufS8WO+P5D
         jmckf+cJaOKcAiAOvdtYTCCtVWsmrHm8Z0bxDJKN1gpB2yOwUIo2p0KlK/gb9Uklv31f
         f7Kg3EQPMNOTe/6FnByZseewpEsGb+1yOcQ49vWJKX7eFMMWKBOwwwINI4DWrnmqUnO+
         bTLKUH2E44r/VDWjhyEEisIyL1hWX17gukipj3Y4yjgZ/O6dYkHQ7sDxR7M9IzQ/GSDU
         dlPUb5ZcR6BFO/c2c3ZnBTAoQr3D31D8Pe0ExHTMIBRktXwr/SDP5i+RjdecHhBU353H
         QA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287932; x=1730892732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZnP8od1AoS68OxrD2EKkqTHcwqcNcZbwTyrj6OQuRU=;
        b=qZqKefjLlWuoS5Etlg40IfY/R0amou4gypbFXCdFddicf0kYkR80qIxJWioMLOspnP
         pqtc8OhMqKU8IDjaGa8lBlnWDlRKmC6u1lEbtZNoAiAt/qVrGL0iDQUls+VLqOP1uil5
         xQYdI/mJQo2+1mllfl8VzlMs2E/CYMsVRN5d7gBWiSE2R+DWXeoCKeTYvzjP9z8cTH7L
         AxUUHVlQno9dJAbYr4Y6vH1zQwefTkb+vhWdE4lc0iradlEPZNFfWF7LDROjiw5+K0iT
         G6hIMVeWJ9tzdol2oUOHieqytkhEmcBxO/zjohkbSUGBoiXHiPa4gBVUY/RVNH+Xhk0Z
         R7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWOu6otVmkhNL256+zNnPU4rjCA4jeYVeB0CFIzR1iTSucdSJvcxG1UatIbI5rfyCKhKUOmno+BJIsE/6jlybfR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7+PRvexHaPYeOhP5yqh9KrqB27Ii3TwvU8EzpXHW8coQK/If
	6gM3qXyxCRAzUApVfZc34Vxr8PWHWG4mUwN1R61zjA0fs35QpUNVHpTuxXpAisDM8SGh30/Jtqc
	yKTrRDvl6mIAWskl0NvrZ6CSm7hF3rdzd88+3tw==
X-Google-Smtp-Source: AGHT+IH5be5Mr1er2W4DdwEw1rjAXcGrKtgAvcc+9eVHVJEX4M1n7mMvnvbRCoX7iQbyEopTs/p0KKfykVLViPIPPBE=
X-Received: by 2002:a05:6820:229c:b0:5eb:fc8c:46ad with SMTP id
 006d021491bc7-5ec23612f9amr11574862eaf.0.1730287931746; Wed, 30 Oct 2024
 04:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-9-peter.griffin@linaro.org> <436b02c6-a262-4015-92e3-454d444e877f@linaro.org>
In-Reply-To: <436b02c6-a262-4015-92e3-454d444e877f@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 30 Oct 2024 11:32:00 +0000
Message-ID: <CADrjBPoq2jbrMC7wBrjGxMwQ1ebTtBNRQzQ7NfE9=Gw9_4LQ6A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] scsi: ufs: exynos: enable write line unique
 transactions on gs101
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_043212_998967_CBC0FE65 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Tudor,

On Wed, 30 Oct 2024 at 11:25, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > Previously just AXIDMA_RWDATA_BURST_LEN[3:0] field was set to 8.
>
> where was this set?

It is set to 0xf in exynos_ufs_post_link() function, see the following line
hci_writel(ufs, 0xf, HCI_AXIDMA_RWDATA_BURST_LEN);

As all other SoCs expect the current value, I've left that assignment
in the common function, and we update it in the  gs101_ufs_post_link()
specific hook.

>
> >
> > To enable WLU transaction additionally we need to set Write Line
> > Unique enable [31], Write Line Unique Burst Length [30:27] and
> > AXIDMA_RWDATA_BURST_LEN[3:0].
> >
> > To support WLU transaction, both burth length fields need to be 0x3.
> >
>
> typo, s/burth/burst

Will fix.

Peter

