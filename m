Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE48CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=; b=cMYkTCxfS+IGKY6PVRDQow5B6s
	BgHWksbSlNOFG4IRpHh4vM+eZqpTf0uCFGGxZjV9uZmkhXLPANqOTOFmrMiKdKIBEjb+RmWHt62Re
	aA6orDi++/w5CMjr6L3TDqnnMD7mFwulHA1RSjdsJEWz4MbG+j9n/bX4fNTgtOKt5cydmWLnL2rgu
	UuZh6iZXmIUhy4zYIoCkH/ZOvFtopBt0iUAQ7zQe4kRKroitzH9E7+8ixu8eGB4nwCg+cpegSbLzG
	LDNVN8YGG0Imr0R3VlY74qCyPjJuEQwqnKCoyPqYKMHtEOX7GmdoFMoFEE85dtzRMOYa7SCsg6pfF
	YTh+VWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPoL-00000002JDV-2BtA;
	Wed, 07 Oct 2026 11:27:50 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPoJ-00000002JCu-0p6B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:27:48 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67699afea08so1805710d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372465; cv=none;
        d=google.com; s=arc-20260327;
        b=Dd+6kDVOrybrgxBUBKtaCRu4x8nMlzoFYpxXT41HjWKHyWNrw2hSlj1gQTt+utz5nB
         Sf+iSv7gRiWV46EvI4vAGlZgnAlcKlPCd/FOTYX2f19A0XcWmb/PNfFyle0yhc7vvyH0
         lh9o/ZOP45FARxW8EDOj7ZflQHGldA03y+aZSaMXzyJdQqjrxUMEKfMC1NdbkfnG9ZOW
         C6ixwX8aQmeoZ83KPu5NRvoq1GOCjfcYeRI3oDZx2yHs/kscPIPTQrOSLC1IVys698yx
         lMlu13sKH4IuhFAXSkTyAEJVBzAkQQkkl6e0qfvJ0Uz4N1bMstcuS2rjbBRtMiG4biHN
         RBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        fh=QGru/C6il469fwHqe1oiBAPiaWTg1APgf+XgH7Dsv0k=;
        b=mJMyUKNjEAPXAZSheEE5bat3kLdnJfsIwtzODgYHrTOzBv1NBPc+jA/C2oi4wATSc4
         xk81fjvglb4p9yRKxWDMNIZM5NOeRt8L/SYKSyO3geg+IoLRUOtbSJWPZ9wqpqC6/7g+
         1ndcLE56bUoXT5N/JtPRPNmFlNnW3yzCONpvBDZC8Rp4g8Vu32n0bHaemcpQ+ZlBv/FS
         CwvK3seXgHBh4ZXtcghsB5dAmTOdEKpMNowZ02Nn8h6EXI2hsdFaMr2JKhlz55dXINbC
         xJTKSLI+028CyJbNjr2NgNBfoocnAWucgFmRAdgWEZCaK1hY5QX8cD3BO27Yv57r8cmU
         x3uQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372465; x=1791977265; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=FSVSBpzEU1y1g4ljvRi/zJiDoKeZEugbHVh5KmTZCoTQjKqnscqimRi+ZL62tjU26s
         JjcwkmaARXzQroWKWeBOWAVRn2Yj6sMw1YOUVc4wWtiDr6yv14eH/WfiGXUHv3Iq3zhP
         RqDBO7Jr8XQwm/WF34MbitZ/bmlNGogL18jfMHWWfj6f8lfPcJviGODTxvs7K9bT/LSY
         W+XSbPiUrt2RZG+F1odi4azXcWqZZPThretdPuMrEl+p6ZpjVGLduy2bCqZpnrcsqbU1
         1f1/MkmugQweITS36FR65LI0l8Af3+p+B/ThjIyNVeDezbBttRml6dCAs29ChiDw8ZjZ
         3MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372465; x=1791977265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=2u5y7GhoRG/1H1alML4pC9G8YNS93VuhlVmQHwnapc9FrMagOv6RYoszmqY1P69rcN
         95q47qqpN/rC1j7aBwS5xKXmZkl51JMGEgTFABlVsRyNyl9XbtF3XTPWb6TCFpPPS2fo
         6AQBR1VmqqoS9HiIhzP7QjHIHvTVHgpG8yVoetgk2O3HObf1tmO2zcEg+TpQro7INGLd
         1znpEFOyRW4wN7KJ3y5qVhjsrgYEbc+DExVApTw0JwT49eq4SOnx5CzHP4w7gm4UQdip
         SNR9Tq1UL+IfXWE6LajNxcP1EshLVJy8BH2l5qOgW8legPlhv1Txx7KrIwouwJvs6Gy9
         uwLA==
X-Forwarded-Encrypted: i=1; AKwUvBzeKjHtIIRtkv6x9XcYR0wPMzJkY8PiGQvOFZeu4UqxSBVImbjL1LNkB96IFUVG1ysrSy5aNAl6EVQMNF74UpA1@lists.infradead.org
X-Gm-Message-State: AFq9FYL8OqaPS6XuRCx2jeuP3XVytLevoR8xYNB1CNhYpbMnmBa3HIyI
	w70wT00NZLPH+ZwIEdSbtDGfRpfxioEBlijqi+m5MD3c0azNH0F/aw65Z4z+NoYJHaXAWssRfDu
	gjdb5EWOm9KRUbesl2SiGP1NniT1QDiw=
X-Gm-Gg: AYBFou2fL2/zUpnTXqFFGkm8DE8nmIADScTl42iKOi/3NqhZ7AGwxATd4Y/C5knDT6X
	YnEk2uV+5Fu04/42ETIhQzVGPRXb6X/SfgsJF/h0DaT5/ht99I4KYl1xEZhpNR1/e/5cS83Vzx8
	rZpX2uPySl0bL/aSfbeS298vOYJFReKOdnfU6mIqa7PGdT1rYChBl2fJhRL+Bx1Fsf2eiZ4AQci
	x7Iue3KyNW+2Xot8fR4cx4hzvlGushjPzv/D6LBL89ihR/n+VdMcWQQPgQdobMBoe4pDeRt4qjE
	cJD79Re8gOs4RD0zwBHlGDvlPuBHbBVE5qzDeTBJl3AdS/cfEiaaV1CDrwmSvgjshWE=
X-Received: by 2002:a05:690e:1182:b0:675:6d8c:f445 with SMTP id
 956f58d0204a3-6790a0b3142mr964922d50.10.1791372465276; Wed, 07 Oct 2026
 04:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260808112043.2781244-1-lgs201920130244@gmail.com> <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
In-Reply-To: <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:27:34 +0800
X-Gm-Features: AclHuK9xkPJNTgSq7-x7dqK0gz-t6G-LeWcqzQTZVQ2BJAwWf9PL48vGNZtximY
Message-ID: <CANUHTR_w4cOAOoYDCDS8bwzPEuYgWp1KjZztgLx-4P1kkhwjiA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on
 probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_042747_251893_B6B62A0E 
X-CRM114-Status: GOOD (  29.07  )
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

Hi Frank,

Thanks for the review.

On Thu, 1 Oct 2026 at 04:35, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sat, Aug 08, 2026 at 07:20:43PM +0800, Guangshuo Li wrote:
> > hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
> > path does not call the matching pm_runtime_dont_use_autosuspend()
> > before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
>
> Your descripption doesn't match your patch. You change change pm_runtime_enable()
> to devm_pm_runtime_enable()
>
> Frank
>
> >
> > Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> > index 4805ce390ffa..470c88f36d25 100644
> > --- a/drivers/dma/qcom/hidma_mgmt.c
> > +++ b/drivers/dma/qcom/hidma_mgmt.c
> > @@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_set_active(&pdev->dev);
> > -     pm_runtime_enable(&pdev->dev);
> > +
> > +     rc = devm_pm_runtime_enable(&pdev->dev);
> > +     if (rc)
> > +             return rc;
> > +
> >       pm_runtime_get_sync(&pdev->dev);
> >
> >       virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > @@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       return 0;
> >  out:
> >       pm_runtime_put_sync_suspend(&pdev->dev);
> > -     pm_runtime_disable(&pdev->dev);
> >       return rc;
> >  }
> >
> > --
> > 2.43.0
> >

You are right, the description of the patch does not match the actual
change. This was my mistake.

The patch tried to address the missing autosuspend cleanup, but
instead of adding the explicit pm_runtime_dont_use_autosuspend() call
in the error path, it switched to devm_pm_runtime_enable(). This made
the implementation and the commit message inconsistent.

I will prepare and send a v2 patch with the fix matching the description.

Thanks again for catching this.

Best regards,
Guangshuo

