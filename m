Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E2BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=; b=gx9YW0n/qnri1rFkS98hlhnuDJ
	d87qx+XFQm1sYrH9yaHR6AIyinmSCEP6mvBrgmHC7InG3UFSdu0JeNm+CvJoSfQfTyZHbcyKbzOro
	mov+k0BvFZO6KGyBHNuVb6mAWwXVk8PzOGSLgql+uAwFylgC2do/67jniRYwht4a10qSfcnqoOnky
	8qjLpeaOaj3Lw8O8phtHlvwxSNcnHjm36kBZneu+23u09S91xYDVFWO6VEB240DbGHOnjwnSthAPD
	LwRYDi4rmdDdyUUaO4N85wFaSXV8K8OSoVRcKc88XqWNmWsjF6cYx2U/lOYfYSSLpJY3Lq/clv09P
	2h6JTo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lMG-0000000BOIg-38TC;
	Thu, 24 Sep 2026 15:27:36 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lLz-0000000BO9l-2tFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:27:20 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66fded6b087so13111d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263638; cv=none;
        d=google.com; s=arc-20260327;
        b=C2o62J5MBsQfxNxLvAl1H5JqmTgrIkTGxy/PRAY3R1Y7CLoi4rPACdzjVd5Mt8AfTk
         MB+FkVKnFwbkxRKjBib+js5ZDdIPFytsHG4cX3D+7wAni7h1sGtl81cbyRqZrweSdli8
         6z+KLInRXHOl5BjVOplthMmCL6uWqYXCSXTkIGhY0iqOapKj72Ahr58R1/U9FPAO5+/s
         BfwqLn79WfUdE3BFlJL2FPjMbm0U0YgsATSXP96icCLghhlGG3eKaqKE1V1VvOR/XFgu
         mM5QgTcF1eqbl+h242ZgjCpfUXPJBUgCNu8IT+BWpYOArWV5BTTgo3NlhbSaQX5Meo7X
         hlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        fh=KgqykHlmQRQfD5Q687GLP7wYjXV0rphikIc7oTgbNAE=;
        b=gX11aqnLWgWKUKiRxEdPa+rxcTzI1npzKixAtU7KXz0r6W/OWuIAKuioKcKOmMNGEy
         kxsFInv3U2KaD13V5ybUhzbAGjHD7EdOR0Q0dg/+ar1TmvULvWldnacJYixvAHxLO9VL
         AY2xJ2d77FSgLa6Sas3nypwIsDk7rcIReyQpcix13weprV1Uj3xstPwaILnLh1NUlt+0
         D4/iqJdLoop28z03D3iaVkzOGy0PRSJ7xpCYLR5u6jQZrh7XxbLVZHwbxn8AVF3Rjmx3
         NJvhNo0KccX/jo7qrSoeShsh9ggusygcwZdaraIX2xp7FG/CgGz6aOnHRCi2SPfyaE37
         EsQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790263638; x=1790868438; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        b=iMQxYpIL1Hod6QupjkiSKGY/ralTt6GGbtoF/Wf8li3OKYMvYqnt7kojps7lv4Gxso
         dcI4C1dq3ZvENHKUW0csVcYK99pxLi2RnzdqznzaMMbLvybpzfxPemjihjcS+sfcQ2qc
         LGNiOITnNkyF7JV4sX1yTb0Psu7Mk6fIqcHyPgnFrsDoZ1i2HGQwOUu5+f7R5EniKjmh
         ECTLfTnmyYL/gk7fhMFEv399WLE0pR/mlEX20jxiZTkFWNUVeez9SDYJ4TfdumR7Gr9N
         5Oyb3/05LSSIz5XlptGrclp9VPeFI3v7EUVj7DGHqlVAUXth1f/LcU5sp0O390Qgbd2V
         y6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263638; x=1790868438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FCfTU9SRyhDYRm+T+cAf7S4JAs9ZVya2rq1UuqyRb24=;
        b=y+5pjDv0KjaH2syPMnaZZPyRvY2LNpeOMGEz5ibnxqIYo/6/6vr5JvuCZbVlhopqpq
         Z7LgOAogQVXJPIJAR4bn8JA3iKjd9FJiooGB9pCBt/W/xa7ASCdBiI0mvHIwLROnYsqB
         +jEfBoyRRn8jJQfI/folNgQIEjalaqKFaKfEDNrjzwVEHbGCsNXEbQJ40RQo1IuVdwGN
         Nm9dOrEd3/zr+7O5VbSvDn4bmkHm9mLjcBUdlXx0Lw4CtRvIzIktXaGsq5sFSj0J8Jth
         tAJrjZpHKMxDljSH0OBZfQAKQ5Ega27de0W59ZiKoE7ROc7xMlj3DNv2LqAkLhr/obgV
         iwIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz8s+15IbmMvVhK2087ojgY/4mM5AP6t00rRBA2XLt8f61HLQPF8JMI4d+IIRmU4QXUhba1nls1GcO/YnMh5o6@lists.infradead.org
X-Gm-Message-State: AFuF++m0nE9ESTw51Ci8Owkgk7ZiIlKhpe23EEXRFMJ1MQqvdhZjpito
	r3wX0k3hNsJLe6S1I2ASSdE11SPf15K7hQcoEf9bMAZ6vY+qPdSiAl7RgD9+NGB/pfAeZchSBrp
	epoCUUHEL6Cx1k1ZOQNiiJlBQkle9IHM=
X-Gm-Gg: AYBFou3mDcEi4q4CxuI6bl54mo6XAW/FAMgwsKdxSd0yo8B95d26HAmEOh1P6Z8orfd
	bMOPMdk+aNIpdCmcmaddy4xjEYSlCjVCXrh81mB+Eay8My2SLioJ+e4VaU/Y1HMS3kZFKy+oyIk
	ka90C4t9VLQTylrplVeDRbz7dtomiRIaPpdxnnGbs9NMD/xIxBcO0YT3KD8uCrt8rMVd88oNlh+
	H1sxAve3PkUd7mZI4+AwsrIKnAis09nTjl2aznYDrIq5btSE3bGHEZ9dypsQhmYUyO/Vf4FBYo7
	qUSTu9YyAYRwnEOck41k9UCkmzSH7gOIRkIOB1bZveZs0pA7jIWHOSk=
X-Received: by 2002:a05:690e:4383:b0:66f:c1be:a64e with SMTP id
 956f58d0204a3-672ed4304f2mr1429442d50.64.1790263638367; Thu, 24 Sep 2026
 08:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260924001906.715322-1-oss.patchbox@gmail.com> <20260924081522.GK200420@e132581.arm.com>
In-Reply-To: <20260924081522.GK200420@e132581.arm.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Thu, 24 Sep 2026 11:27:07 -0400
X-Gm-Features: AclHuK82l9ZaR0IUnPDbcSKEOTQfVhmelPZS4u7C78ZsgzLXCQHXkDmfvBdAZqE
Message-ID: <CAGG=RgCwTOTLdocpmSc9=MpzhHwaxotc9GDDQA2C-VNHpyfcMQ@mail.gmail.com>
Subject: Re: [PATCH v2] coresight: Check runtime PM resume result
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082719_737081_BECB11BC 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Thu, 24 Sept 2026 at 04:15, Leo Yan <leo.yan@arm.com> wrote:
>
> There is already a patch that does something similar and fixes the same
> errors across the CoreSight folder. See:

Thanks for pointing out the existing patch!

