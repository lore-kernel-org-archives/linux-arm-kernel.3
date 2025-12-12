Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BBD43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DI+KXchmH44mUxxpsbUV6PudffQTHA3dEjh5VjxDDHg=; b=qtGuE3W7h/a8/rOzqayKLkE5RU
	ffFOu3wIzcaF/nPx241W1iMAaw5G239Kdurx1GWbDznvqrdFWzr+i6ySnuHlwYz9yxoZm2CbbSXy/
	X1LjZA5TyaKFREXsTMh5IRlpB0UP8YMpXFvXyYFUM87mi7u8V2XpIDk+vYEeKDVhuGbHTZasQURs2
	WRYoienTZLfS6TzetZmGV73xj1/VdnL/Ka4a6N6FmLKYgQTID2CswUijAWWJc5zhHOvxvY7TEf/mt
	louRfcjwaxfIinvjIAyuCNF/b89MrXGNJtjt3OEJR6et7DsYkxg6kmF65A+iq8AN/jozpxKloclY0
	9sxlx11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtv2-000000001Ny-2SB8;
	Fri, 12 Dec 2025 03:34:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtv0-000000001NN-3AR1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 03:34:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-34abca71f9cso64896a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 19:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765510449; x=1766115249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI+KXchmH44mUxxpsbUV6PudffQTHA3dEjh5VjxDDHg=;
        b=coF3Laik2qG8v0HZmAzshyRn0xRlgQxutJO5NMJapUUV2iDZhMbe03P5HK40ekjeVE
         BZmplkR8TLVQo8iKjyd4sJL2lMGmzDc/OJY+DDLW/sw5kAgIM5cM9INGLjeK4ZdB4fQ7
         oRzlMgz6MfXA9FmXWauysdvlfq8rLOKpwuse+sDNsDY6lY90ft6oGx80qWfqIt9iKFYk
         BO3VFSVg7KBZWOPm/kcUQ89xO7OQ+pLyYgDdRklzxn4eiWjNB4dBr9kzpA0mlVFFzrqW
         fC7Lo47lZGvkaDk5VOE2rDyfeY6TIOu4DJLAYiMY+11mZgxDr3EcGY8lFKzAja/QaDDg
         hB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510449; x=1766115249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI+KXchmH44mUxxpsbUV6PudffQTHA3dEjh5VjxDDHg=;
        b=Rnh5bfLCbnz5QXneepyA68VSBJOS3qOdWRNVDXYEm1LGBfyASX0pJwhXfz3zp7xpGZ
         repdkUU4mn7icd/FhRlSPwhIsB9PIO59tlzb7mUNnrPCYHxKvoCsLHhxp/dhhcED/YeY
         D4A4ZCOJ9uNrJgU6Ec7UGqz/UazHXU7nOdkVrcilKKi12WDJFgJq1+qcqQ17QumYNRdU
         5sogrB/k08HmsLy5Sft7lydjjSbevXuq3+veas1QUcyoYZU5I9AyQvZkC6coF3Cd6TdZ
         8UdJs7/KfVNJxmfBk0h+I9tTA18oyH9d+yg6kDsZbsYgX9F+maq9pDobmCqeeQLwKbdb
         EQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWsH632WGfPBPp5cMIEBS5aWaEMg+f77crBeGsAyXtcnWoF88hs6l9MPAXl3b9he7QtM/t49urWJROEqbbsTbcK@lists.infradead.org
X-Gm-Message-State: AOJu0YyWKwYs9GnGzSbndEnV5DWxhSW/u0ny2M3PYbSwye1R2urfegSU
	GZpB6Uww+nOqSc8ysh9waIIbZQNvIOH5UbRrwQtmGzvT+FCOykI7Eh6p
X-Gm-Gg: AY/fxX6H2vSRa5ZwPlDGNp8E0mE8rlNU/yRUGM23H8v9FZn07d5plMNoSiBAEUcNiVi
	NaQp14BnmNiqVpBvqozGWUU76rV0aS2ZGrIGZi27XH1kANwybXxHdRU4wlipi/om3LTP6D23iOB
	xBJ0SuRzA4cvLYFJNp0VMlMbtZCttWepQQUhTzjoPOkGtf4nK4M55bkNVMUF/UELBWLEpr7dbBL
	amYaWHRQoZWDbBrEmV9XXZ4zLQv2rdk+82wj/dKv2NchTZOFnRg0OF7csNtlHyz5ObOWlagHRlU
	bdUTl329npKuZmjSDr3802W1xJMvmn9nDGSEMX5BLILHZhISccmtrjvEPTTZcipEmkkIUharOgF
	84tYeSgvAcuHo33LSsj9DjQNE/JVw1AxCPfXnsaUovRizVdsBJwzw6qcZV0hsdkZaCdnGEo2wtD
	FNyVV5W8OPr0aWjJc=
X-Google-Smtp-Source: AGHT+IEq2LErwdAEYXkfS1MvdZpjTJctOQkyTkNrB4+pZbLaSSuDnUfhZAotu6OCfqjLgju1qwGSvQ==
X-Received: by 2002:a05:6a21:3397:b0:342:d1c5:491 with SMTP id adf61e73a8af0-369aab23434mr604352637.0.1765510449357;
        Thu, 11 Dec 2025 19:34:09 -0800 (PST)
Received: from rock-5b.. ([27.17.162.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5996fsm3575764a12.22.2025.12.11.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 19:34:08 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: benjamin.gaignard@collabora.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	robin.murphy@arm.com
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Date: Fri, 12 Dec 2025 11:31:57 +0800
Message-ID: <20251212033157.3036182-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_193410_795484_0D821469 
X-CRM114-Status: UNSURE (   7.46  )
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

Hi,

On Thu, 11 Sep 2025 17:57:13 +0200, Benjamin Gaignard wrote:
>+#ifdef CONFIG_VSI_IOMMU
>+void vsi_iommu_restore_ctx(struct iommu_domain *domain);
>+#else
>+static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>+#endif

After applying this patch to v6.18, I get error when building this driver
as module:

drivers/iommu/vsi-iommu.c:541:6: error: redefinition of 'vsi_iommu_restore_ctx'
  541 | void vsi_iommu_restore_ctx(struct iommu_domain *domain)
   |      ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/iommu/vsi-iommu.c:31:
./include/linux/vsi-iommu.h:18:20: note: previous definition of 'vsi_iommu_restore_ctx' with type 'void(struct iommu_domain *)'
18 | static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
   |                    ^~~~~~~~~~~~~~~~~~~~~

I have to use:
#if IS_ENABLED(CONFIG_VSI_IOMMU)
instead.

Best regards,
Jianfeng

