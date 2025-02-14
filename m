Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC18C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 05:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJPCGK5odp/3F1yq1vx2hbjH1X5QwRdLiHWGZIvwguQ=; b=FglXBZs+cigSZ1cwX3eO10cCaw
	2m4PdLl0mMmfOLsZvCBjuYPfHCIw80m1nTkxGR+ebBFRsxSCmdYWHACk9fA3s5MNXuEXSd+ivQGEO
	1cpqMicUeqybcM5RXOdQSO4L6vmwO5GlEp9tO24MJfbqXMejSD2iIuOD+0dJH+h0jN7/m7npXqVgT
	qb9FuGWy5tCpicrlZVUybXyPDLylSEbr2z2Q+7PfaIaRyYuh4kVnWdKQaClTXxi2WPHh8JviajCed
	AKpeC/w8UtPKuXjvLrbldjzyJ3KHm0N8xP498J/YbbkEIcjKBzzx76GsYgLitY7XAn0E+H1eRCa+7
	CrdsuWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tio5F-0000000DgLN-3kLG;
	Fri, 14 Feb 2025 05:17:49 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tio3o-0000000DgBk-2Lse
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 05:16:21 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-52088c0aaa3so205005e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 21:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739510179; x=1740114979; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJPCGK5odp/3F1yq1vx2hbjH1X5QwRdLiHWGZIvwguQ=;
        b=DD3dqaugNsyHAyjJcyKU4pNR/XmJMcEhnWS6RXyTbVraOHJGyETGwx1r7gyS7LCHfi
         112OnbIb+4zLTU8Z45M1E0DQBRz0IT1OkKx1VrCKow6vHw2C666Og6mg5gk9ZjuaVntN
         6/ggTQa7vLuVs6n5d5baJjVJ8LoPE2gWGA0d6TYePz63lIKx/5NmZY1w6Duy788xjMrN
         LqVvixL0qxazUtkUYAOVRZkWYSnZtDw5HbnBvtxmXJIZSQVpSMyBnSx2qa9zh6de3ECO
         IYOmhND9jeMzU/ooNqUO3KENq1hCADnij2nQpD2Kiz1aupx98cOl7SibFyJ4g/SSWOul
         S/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739510179; x=1740114979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJPCGK5odp/3F1yq1vx2hbjH1X5QwRdLiHWGZIvwguQ=;
        b=eu525FWhqw+IeDINOaP57SGf/cr9e3ULNBn5Bv6XYl2NX299NU6t1SxtdTAeaj238P
         N2RJK03WmRogr676eDjniklj7Kz/U6l6F22wmEU7AOmg1pUi0O21kt0mEvkjZSdjlzzn
         alRJxK3PCP7U3feiGYTpceDWXp/gPZVz0246pZew9Zp5n/EC1bSYd/0DAQtds6mjrzc2
         wa5HTE2dQOa25TjST/8nm8g5w1HxkDscqo9dt3CuERv0uXF4yenFOKkL8d8UKBflanc6
         3aGi2/3/Z0fn+qO9zBjxn5KeaAnZGiPB2+9mAb+nYyOXOfGcILAHfXscLHb5VbTJERuC
         +5FA==
X-Forwarded-Encrypted: i=1; AJvYcCW/sXt6/4BPKaVnz6SsHNqRDOGYLxU7JOZB/B07o9/AbFjPaGpzI3GO5VvT2SA4hdnmEjnwwP+AWvNxERPW5+V+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ3zwZoPwFUYIC8WYViv0kD6RpInntWqrn8BKZjuHpXYBvBGSc
	9zEsOuaQIxXkB9AB5vY6ofixxyTL2jiPHqvP6oYUhYnAj8NCHHuh
X-Gm-Gg: ASbGncveBhr3TRtVDX1tFU58hIV06NtYHh1Dhvp7ET/+eojsOcCOwcvvGaelLNnK/sD
	cD/GDbguEvoGF20PwW5r7veY9vykSpSi9JU/oKwhysWCnsj4M16FOz8S8pL+jnRoP8SKZ395E28
	OHhysf+RzPFgzIAuYuREbpu6rX4au3Mn6udeYPOgXuDvdbjui9P0ONu2MGj4QN7zGa5R74sJXJn
	ekwoS0uRTANA+rRjxvoWwJCEfeo1+3vJ4+uQsMbcNkHoKsPJ82e16KlOMeDYda7l4+rQ4qyeK3P
	k4HhOjjPCBNU/H/mObJ06Ks/ohN+TMv5CZq+bfdaHurxpC2gFIhXelKyG5nriw==
X-Google-Smtp-Source: AGHT+IEX/WNSDCKa8Dsz6ngWsn6DG/0ewhNCAlkMgc4RIwRsVlbZHvPWOyn7kEIjyOMg4W7RwOqfFA==
X-Received: by 2002:a05:6122:c97:b0:520:61ee:c821 with SMTP id 71dfb90a1353d-52067b68446mr9334990e0c.3.1739510179222;
        Thu, 13 Feb 2025 21:16:19 -0800 (PST)
Received: from droid-r8s ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa3ffa9sm459940e0c.8.2025.02.13.21.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 21:16:18 -0800 (PST)
Date: Fri, 14 Feb 2025 05:16:11 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	robh@kernel.org, semen.protsenko@linaro.org,
	wachiturroxd150@gmail.com
Subject: Re: [PATCH v1 2/3] dt-bindings: serial: samsung: add Exynos990
 compatible
Message-ID: <Z67Rm0HoEqGsiL/F@droid-r8s>
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-3-wachiturroxd150@gmail.com>
 <fc341dbf-3add-4728-9ec5-7291ad3bcbe9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc341dbf-3add-4728-9ec5-7291ad3bcbe9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_211620_597928_877DE48F 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, Feb 13, 2025 at 07:20:22AM +0000, Tudor Ambarus wrote:
> doesn't the 32 bit register restriction apply to uart as it applies to
> SPI? If so, you shall probably fallback to gs101.

Of course not, downstream of the UART serial driver there is nothing
specified about 32-bit access restriction, nothing explicitly
in the driver. [0]

https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/drivers/tty/serial/samsung.c#L1543

