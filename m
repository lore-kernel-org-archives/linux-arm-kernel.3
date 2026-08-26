Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B34C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmuwxalehGuplFytR3vLTTzoSunk5f6Wa0R2J+XLigU=; b=BCN+QXEfVL5NuM1zD1+hEU2L6h
	osbiE2kYFwnGfu+FPNOYSEgl3DLyr6v/yOpCuPbB23t9m+iQHln42bppIvV2ELvnnyeilyMvL5oN/
	OXhg2xvvKDdAzwTQUOWdMOd7NfivRtqHJNLpKQtKs3MNCCCXn36xiDE323XH4Jn89GY5Q5K23xS82
	N3vBo67LPtp0DlhhW0lEKcwKGZan4BsikhWEdLFvmJX2kbDu9ihOvqK89kgHfaa+ZiWB3drIKxQP6
	UaS28L9LG510jwYynLc6D4G9AQ3rgqniQd8t+Pu1ShlUSHhUAs4M8ilVbCQeqmCEXQQTZW0S9VGzl
	baeYOvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8dR-000000023AN-1hC3;
	Wed, 26 Aug 2026 08:05:25 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8dO-0000000239c-3HEd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:05:23 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-66d0c8d0d6eso610408d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731521; cv=none;
        d=google.com; s=arc-20260327;
        b=HH8CzLWZ0unoTtamh3/D6X5s7LIr2DRuO3Sywkmv5T0Yzv26/O6APoCBjVErzZNfJO
         chtOB0v8m/RSebRNlrnMCdpOZHZpBrTFhrsr/TYlcii8sZsnTRLx73jV3Uf9FW9gJNuM
         ZQQX+0xzCCQdH7722zVWRWLCL3uVFn/fmlrVuGSdmPjxtB7dcqhWgsxGikC4vSej8S7s
         hNicnOUJ7Bw6DpICM/riVJKCVNilCp2fgOFUvW5uwZ2eO2OB49xGb+ZxHeXZ/xvQxjju
         r8CF5C7Dbzhp/T4WgZ37jNdfKeZHqVC6iiJaq/yuyECfDHMWDuL5605Cx52i9nHbZM7p
         Q/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KmuwxalehGuplFytR3vLTTzoSunk5f6Wa0R2J+XLigU=;
        fh=IOfGWLVd9qXMEK0gWoQ9f0+vBJa/u+NbBPicRx1NFg4=;
        b=B2C6c6ZGhWzG0IjGKpryaz+jM5ZrhSV17jmA9DrmzgrKhvLsK9iNDLpLmXFFezNUlh
         GvmcP+CnkMFl9Y0wZTZacCvYGhgkJWnrlbI7FB7wS8K33D73DlA2Mg0Xk32WJv4MZa4U
         2sGpHgbaBdYEywxH+wKyetCzk7W/HPPZzsMWePjhhCtQVZYgHg4Gyh/o7Ibwzxzpkj2q
         0gdUvO4XH0slyvb2Vr5Q3fN3EHJy8OF/RrbSRhp0zd07QhDpBTmK9vlcRCdj8Yd1hfAB
         PRhe9afIyEElMPdcpe+wbnGTGx1c0YygUm8rLPAMc/O1yc/ofCyklz4mo2LKT0sUSzKB
         qJ2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731521; x=1788336321; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmuwxalehGuplFytR3vLTTzoSunk5f6Wa0R2J+XLigU=;
        b=TGgf1q/Cb3TJ+/YeyNcqIs/qFXIMph/KsZ57TzNXngTr1uk9o9bwRSwEXFlOEzJAGR
         pDq8xkVxzb2RmyvyfG0l5Y4iqEip9Dn5vJyn2lplYSxJgSZgspIoy3hSORrlgYAF8TFB
         +g3cq3aDhgs3Q35+XwA1d+ENY26W0ENOtMQpvTCJqUjxHSZbHlrYY39RHQJ03kNl/QMy
         QrQsaCMZiJA2O8ipgsk75Z8S7LXPCcaKTV23/FsSTEtmvOCKXhRMyCp9zYuQH2Y+3sWI
         zKxwyOBoJq3aPlh3ZFAv4h40MViEfoIxuYhzfLtUmq7kX6z5L9vU2I0ArpQRxpHi1C5N
         ii9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731521; x=1788336321;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KmuwxalehGuplFytR3vLTTzoSunk5f6Wa0R2J+XLigU=;
        b=ah1wO59F/udjXn6brWwui0JBD2k/9w7ugbc04cr8HL1L5pb4U75hn6+mw41dohYxRD
         zVJzHkvhsGelSs1aTQHgFpXHbSPNmRczhJfagQsT4FncIUuNbd8wvfueSr7w19z5zEkT
         69oHWcKI+CJtY2BMBVa0HgGZhP8ylVXWj+KiOVmGhi3MwLsR7OIrCvszYJ/Tdvnk5x0k
         YWyBMgRRN4VKXALOJJqTKa8N8B7SoW4BtuOfVIRQPyTPpSjxB0pnprUeH9GFvjVCmUPw
         dNxv7FEo7OmYnPVUZFGzNb/Nsn7pkevqo4fj/cBpnrjRrQug3QhCCEV2tsRw0K77gYC5
         FCqg==
X-Forwarded-Encrypted: i=1; AHgh+RqiB1tcT/aOcMBwS/CIAGQcicAinBmXbB6lph0DQcW60Ds6xQD+uPeGMDzPa2dlgcpLIl+K+b+238LzG/+xIkNR@lists.infradead.org
X-Gm-Message-State: AFuF++lwhF4qx1Ah1RDl02ypIC93Qc+nUbcDRnauxcf6A5GDUs7kok8g
	kCYnVoZy9yVbZyaBqMWO/LTtvlkkqOkzBa88q9BxGgJ5iWzo0cebvJYoDMoLy13SHJ+7bI2u2h/
	gH1UISCwhXQhBMcoQgIcYQXVahbaAiCs=
X-Gm-Gg: AR+sD13W3AaFKhOZyqoKnE3iAdK8iQqLwupvX5jQD7kUxzOjy+npxpp1DgX9OJhQpKM
	J1rTE4lD0Glnux2PC124utvIPJvicmwvnaHId+XJIYG/oSdtnf1nyihdCrjw78Xe7ltxvvhwzWZ
	lLXFUQA02glzlU1zU/gt9ZZBtAS3kgGEuWKBw7wybS8etY7B1Ah28qAYcJuiddhOaexYr5z13LS
	2Ncmk+vZnyPUqrBbxNDljiqolERRScs2NoxI3dOPFQ/VRRPrQuB6E/G3nzmNiH0lPjJpomJxfCX
	U/aO/80Gucs5cDKfV7pUpv80rKVU2Qofvx0+8TP3Mli1oII=
X-Received: by 2002:a05:690e:4888:20b0:66c:71a4:6ef7 with SMTP id
 956f58d0204a3-66d25798ab6mr1235400d50.35.1787731521100; Wed, 26 Aug 2026
 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260808093623.2744314-1-lgs201920130244@gmail.com> <56cdec83-94dd-4b9b-9c27-6bf9ce8d48e9@kernel.org>
In-Reply-To: <56cdec83-94dd-4b9b-9c27-6bf9ce8d48e9@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:05:08 +0800
X-Gm-Features: AcwNN1WLK9t_-88mJlI7CZZJzYoCXYqy5liouPolaAwWkfdtLNaUTcfSb15eJoQ
Message-ID: <CANUHTR-RiXT6_rz4Wrq65FChRfZsbtb3kmn4K8xummaXOyn=wA@mail.gmail.com>
Subject: Re: [PATCH] crypto: stm32/cryp: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWF4aW1lIE3DqXLDqQ==?= <maxime.mere@foss.st.com>, 
	Colin Ian King <colin.i.king@gmail.com>, "lionel.debieve@st.com" <lionel.debieve@st.com>, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010522_831876_46C309EB 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 11:36, Guangshuo Li wrote:
> > stm32_cryp_probe() calls pm_runtime_use_autosuspend(), but neither the
> > probe failure path nor stm32_cryp_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 65f9aa36ee47 ("crypto: stm32/cryp - Add power management support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

