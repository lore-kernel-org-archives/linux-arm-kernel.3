Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4549EC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=; b=uuJuKW8dDZmCG1qPzMBavxFX06
	P4emO2l7YWUOr8BeQgTtJXDvds5ROT6I97SA+on8JHD26egEu1zIoQzI4qnwMRwdfDCSBIflouccc
	R/37OPMoOcG6LQOZGufrdOAbD+SgWVlXHy6TbuhbcXVveq+Gxi34JTEE2Kr1ht5dLCb/y5eScufgt
	Rd0uOUaIVM48dNI1rV1MzFlU8kVOouMeAKtzV6Xy+jo6ToCUrbyRfr5hfkDakmnuiciTIDvYfv/xA
	R/NG6jfqD4jaMtcUVOGvrIxbC8Zfip3RKrvlMiRg+OmLiDp30HaibIbAJ0hR98gr2zvgnvwZqPSIn
	Jvbt24zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscua-00000009BvG-46Ni;
	Sat, 08 Aug 2026 09:00:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscuZ-00000009BuO-0OVn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:00:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso276342b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786179610; cv=none;
        d=google.com; s=arc-20260327;
        b=X/8yRTFpfwVL1BGPzRIDofYtCzKFpRpv7NuqOGcz5R21VeihufLkSiOCfBvu5TjSsk
         yBiUd0PJrczRcG+b4abj439rGW2NsLpmBuKx5wicV1VkoaXVISrnEIABO1taBWpk0PhQ
         DNsQ3Sn0OU22BMBQTLAKEKrvGpXYCpnLW6u9eMFi9Gy89NnxOl+BFFfgjw6Jm43RQxmw
         lMXPFUSBpkUQeCjVbUSECyvlTs85uc4WVP8ZGrFTbLNtwqsCBAGSiDVRd8sIkPP19MRC
         d9mqLeSS1vFEBLdken7G7GCw1HGTLuU6nG8SDVljk1Pq/VXl6lrCgYyGbQArmyMEoewC
         QUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        fh=uFl0vm3mezYzpoX1/tDJN0Ln87hw7Q6GYn7yCEIE0D0=;
        b=mvwnPue+KgR24XPpzMYwh/ICCXRsQXTibuzVMNp44+JhzC2a+duZkpCOdnuRSmdUBP
         B3xvnpHKFRNF2Z3pKuWUO6cuUqq6x4jw8YE2M9dPuXOGGJlwBxKuPm5eQRuJQM6ftQeB
         cYWYSV4lMmYLLbX3mnMvkvALYJhZgcVSAthbmCaUo/6Su2KKEfvFXxwHmDqPILFwu2lO
         AfdQi902bm6hdkNYmHPOoNgkm6Vw2ElKgFPMVvSoclTkYBVDMXNiH7i/pwDTr10kUP5e
         e7LXj61/o8XMK6IvcQhye/ZgP8w+EHRpICfAWeM3U4ePDz45NdjQqfY9CA+gnVC1PJ6C
         7hCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179610; x=1786784410; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=eMRZr2ACi2gj81Hw7hJaLenrbcAHCu1QY4t9kBsaMLIFCquW1LOH7i6fuuupVFidQ4
         aeZFTkTAdmxlkMMw+HnECsnqbu9rtuI8nsukHaQJI+WE5XRozI3Ax3hMhRl1nqD9Jvz/
         5pelILiZ58bc3D4Xv+bkWTj6dG7ZxPyXz3rSiCiHvgpwA/wznT+4rrx8j5btlsZ4Cq4k
         xJzOpJatu8fED9uQ0gR0VM1fgvTPW5LS0qV7tpaIlceOQe/eVTT/9dbxKW3sPLUmK2hV
         8LEb4a98S8ijC5os2VXD4ziYQsqgETWIFkhkuiB50gXKVbB/2Z9+VSfQ8FXhajDh9RZL
         +dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179610; x=1786784410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=FEv9p4Ny9qqiTSfddncG5M85nSJ5H+LXLKAUrhQM6A8mGxZ/2uvbrYQgLeVuJYBcRf
         IuBR3VgDw/fa8eznRnIEtjDfhnmGzViQJcHPqtEipnyrhOh8Ki5luPqlcHNZCo7o3aGp
         8u63m/pglrq0zTi8rTduLf3OxYxICevwP9gMMj6xUM/NgonAS51HIPr01C/VYu48ALVc
         C2BudlHfA2c1biBAPeOCJxFuQdzIHRWA64ihIG5RM6r2pARglwJNuqO1wRJ/RTJaNvT5
         qVJeOJQDBfAt2LPuWZzBa+p+5P8gAxC+Y+vLqVgzeJu0NzROMj2ACVCx/z+aTA2vT7EG
         8Fmw==
X-Forwarded-Encrypted: i=1; AHgh+Roru3eh+kQknkHbICokQvRtvDSRaUWhLuD7EVB/kAujQiRyJqda0Ggu0s7FmieVik+YSMf1HEf8PJIDOPPoqRlO@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQiSVm7vKjnCO1Q9/S7Be7bhQ8z5OXfx3PHn62rkSWJZK4/Au
	NwcPrlH/bwbin6rI+XdBvXayjM24xkRjGaHaYw4QWMSbVSCcQPTX83nTbVTjSF+xaFTrqYmAY7r
	JrsJf9ymzu7O7t8UiGR+XZshhNkegNVo=
X-Gm-Gg: AR+sD10BsgTCxSNXVF5BLucdlOpo1E6LPV7iLC9PKpLbAcnftisZXdmCmdYSeyHVwHB
	xef2Kt7eUfy5BKz+Bdk8j3JmBFW7qHBmvHDdyO1DSU63UlJ0elDxyLoao1WciJm+RSGPY7Jj0rt
	auUeEQn1RR0Up8IjuA/IKPGreC6zBn/xGtmp9LWrJKvbKIXmlr9eRTyXqhPyHprUbyCQjcZxVnk
	mnNhwtJQ6lRvhLOaWQus/vRBosqJ3l5hBAX4pvjs9xk0Hien9Rnh6jHn7+dsqAbUJYzkixiwqb0
	NfreE+3g1syJxTB+Ebra2HVGs52OWcbP8mjULuREBDQ90BXm1r2cNC8aMP45xtZyWXlS7ruZkzt
	J4xFM1erwU1jeslBFlwYDmueByhOzShv7A8n4pufw82RiUg+UkPURIoNruJBYLmbkL3pWucbfTd
	+rFEKhgJJnFEtE1y4=
X-Received: by 2002:a05:6a00:4c98:b0:847:e2e4:a36b with SMTP id
 d2e1a72fcca58-84f6b879bdcmr4679831b3a.19.1786179609674; Sat, 08 Aug 2026
 02:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
In-Reply-To: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 15:59:55 +0700
X-Gm-Features: AUfX_myHjaHhMRuATtXSNJb3hMWPktXUxThFKw4KnDmx30oADvzEsWx9LpvQM5w
Message-ID: <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_020011_136405_F39F6C22 
X-CRM114-Status: GOOD (  10.39  )
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

Hi Guenter,

Thanks for the review.

>
> This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
> even if irq > 0.
>

You're right. I misunderstood the condition in the if() path.
I'll rewrite it as follows:

 irq = platform_get_irq_optional(pdev, 0);
+if (irq < 0 && irq != -ENXIO)
+        return irq;
if (data->pretimeout && irq > 0) {
.....
 } else {
- if (irq == -EPROBE_DEFER)
-       return -EPROBE_DEFER;
  wdt->wdd.info = &qcom_wdt_info;
 }

Best regards,
Phuc

