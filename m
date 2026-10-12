Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA06CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=; b=CJTpV1tIUfYwCGTfT5aCGMxThJ
	j3e/vqtAtjglegCwSnxHDWqNISqWUZ3migd7+0vDJGFg1SH252tXZR2pNbUUYe+IvHwtaAFtEr/vJ
	Uy344MByQWjQUNdJCEvqHSfOTFdFnBTnAaA9g6Fcu1tq1uBhSlvYpEUvN0gmE7hIMYMeYQF8DtrPJ
	ElzPtAYmArJ4rMDIjqzak3DNWPYhAbw/E/aO/0/xNIdQsx6+42KSNTN7olKr1n3xyjquH1JlnI+YT
	RvCnRN/h+Rp+Ie/MErNKdG8+TXoeP5+BwW0Q5Vg09jr1XyO7pcUyWbzv+EycnmQwEvjkz0mHSmeG+
	YBqBaxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGC8h-0000000A29V-2uxN;
	Mon, 12 Oct 2026 09:16:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGC8e-0000000A28w-3P7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:16:09 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c315869241fso236392166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796566; cv=none;
        d=google.com; s=arc-20260327;
        b=Mj0c0LOzcEqO4hnes0VOvej+JxcYd5LAvNBQ7ndZTJXQDQfgRDIsfiLILXWTAJa1bA
         IBvkbzx8L8yQ2k8gn1S+awk+y4CZEDOt5bh6U6RFfiH8Jd7cSdO3dvTrxT4vHDDWbV9B
         U+5ALcWuck0UOl4odAwekiD4SyZKxoEkP04Cm25sM5GB9+skZxqrnbtpsTMAy4Sn5I5+
         Hba9jBwNOQsnbdiiqFv2rL+d+k03kchsFSTPeB4POlm669EIKvBiVcmFwLCut7iZr1Xh
         yhtg7gLl/UBSAdD+/v6fFS9USp5gu4voUO5Q0YWFiDShp6LIOOn9KZlrhiCQJcFq3rxh
         ChMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        fh=2LpMR280mHhOTSZ+wtcCk294HeSMvyY0NjreSBNB0R0=;
        b=hfXMzboNGlyBXgrH3nr1+lxRNZjl7Xjq5/5cQw2QbSkz27MKjd0oue3Ivwu+/OaTqC
         EoaJKYp9sRaGthgBf6gf9Ya+vMX3wEpL9a2GP/4WbnVqzjzkusb4BY86Be/TrRh7zcWX
         A2w2pRpXNF7DTpl4+rULiSLNO7mZkdutMOkeJIu4PjmgiolATcg2s2RcJ1uP1GhzDLD9
         hx5CcGPsLnXNCvja0ZqIeuG8l9RchK5px0suQ7lL6AQb4t3SYLcPPM9KBBnLWBxJxAHP
         Gk6V2RhvnobNvQ2LvbwjXHQiNraARhiDUf3JjAOlDUULlU6sBhtX4ug3GttZJf4uUsAp
         Wz/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796566; x=1792401366; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=IU6aqgwGQ0y7Hy/vramQwj0kQU55RkKdJpOh9PyJOutEFaOkiwQZ1E2UbcXRHFJq3Q
         3r9tm7DcJufJ0or8Td7ko9PBXBe23YHZUEQICW1rUd1h9zTPf9c+JVqf9spCOa06iz2S
         4hfFlwP9K+u9gVPv1K80J3a/tjiuNEcjyYuCawopK25BviPCbIywqnLce12CCdqedgNN
         OPXTLEWE6h/fJk3VTXp0gQMjVrLl+MlFotCFzp56/AHzz5XGfbjv6dH7kc/BJ+UYyzUb
         +/1+1o7UyDiY0d5jQEZ/+t6+5T+6CjmxWcfj8/lXbnSxxX4OrY+OGOTS3dzW9bgTUFB8
         MXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796566; x=1792401366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=ib4HqOwVHq29Bo1Uga/o9ahl2J1CtRWG9ZmIiJri8i2FEDtkS2krgMB9ng8CvVsxGK
         SVo1sS3XeI6qO/XnOvhv+AGpOgY3cW4VLnEmW+gxjWvaRGqiOUKGu99Anj+RFghhA+Lz
         PkeZ36gROLsDVyMgPYKhO5JoW3FiZuYILilAs8cGrRFfC6jAS/4b+P0+HRuV/DsuzUU2
         RK2F6yrrMuGyjP9FNaaxWUXLKtp5NkFSkENnFMUJgggHO93BNsEJR4COHWTaRqlNtGiz
         1vaDnV1cfuCCdGl1OSvpWy8WFqa73zDKLFQ5DPi3YIAALOAwtDrN4hkShpP+4piOdg3K
         ICMw==
X-Forwarded-Encrypted: i=1; AKwUvBzaNtHa0W+rc1Jd+nfrogiCN+CKLGt4UcfP/9MKfzX1BODhrKcuNcg8KyFTMJJKEQ5x3QCBq9S2VDx3zjfdPNIl@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5W5yVgHkXMEPNWTWQfXnVA0UF2lV8lhSeSAvBwxEnyGie7e88
	HKIY6frKlMxM0Enx1jRZAZypn9vUXYKAeM4PkYnQ07ufE0mUK9Q8u1OX81Iwfr70c4wPPr1+QwX
	uFqttgjOevrmWBj2vdkVkMK2PwMArYbE=
X-Gm-Gg: AYBFou0b67lpegTVQpKHmywa3ZfXRnEn1KiOtls2FC49vTF3D9WltEyPTIwKGudy4Jq
	B40MhZYoAYaXo/HVbel5A3T/YdunbAOO7rjsLdspAfaOlZo5zsDrwHun/ygkdVUuX9XG2Rn+ciS
	GsXi4eCUL1zZNg0VF+ekHeqvf6vI2NSATeCRGviZzc6nQtpIU4VYRtomlfvqOOko8Lup8KWvYD8
	C/S7DSwiPgfssJHFnlZRGtlGEGZgEk79sfhsTwAELulPzaYJPaBFXR8VLHyDf9/jmd0VumIxErQ
	t/8rmPkbcAGTA6lQATJ7+EQrFIQFZ9E96AktsF3TA5oscb2cWzd0493CVdLKkcnpnUKnWIOGoSw
	9G7fndVXeFfCLEv45SwLh0ajIpGhByL8cgpwCllQxamhVcXBT4uuufe4ezS+KMn+I4WSHfmJRji
	XeVcREIq5CfDGQ4P1jw9wNbIB9M2i4/XGmjYsgNgwf
X-Received: by 2002:a17:906:7948:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c31aa02b449mr838815766b.46.1791796566369; Mon, 12 Oct 2026
 02:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:15:28 +0300
X-Gm-Features: AclHuK973sM-FWRDdJi0fSTDjgQG7reB3UnWpT5L7Xl9I9NH2wEexbwNU5tVEtc
Message-ID: <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_021608_866027_7A3C865D 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so use atomic bitops when modifying wakeup_pads.

The code doesn't modify any reader part of this member. So, the above
paragraph is incorrect, right? Otherwise it needs to be clarified how
assign_bit() does change anything.

> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko

