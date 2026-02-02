Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56359E7FDC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbVzDr6j8Cnfut/dHFXPjRRVJpGHldRxEVpuedl20WE=; b=JICLLsXEgnrojfMS/8n5o3oy7f
	Koksk9TqnswmU0b88eHdaqPIzWptDpC5FHN9vizbV+hmvhkyxta7iQ8zzBnz3RmpW1BvlIw3BgNMg
	qEbRoMMndVkMJ6vwNoWfrGvEXtfjaHY2oKLi5t5d1aOebyjgMqn4Z7xXXIwLCHzDvzH66cLlJ8PK1
	I/TOai/vNp7enUka1Eqm+gSF26Ji4uEUS0KD/n2ezOqoib4tvPHyzGNQEcbFmW/KA6NkGKy5s2i7O
	VSS8dmnr7IxedsiMmu/YNdt9Dvebbetu03aa0TAkAoqaSKzjpeHZ+MdnAO7BCIoG8oKZ68M8aSmpw
	zQKB9ReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0Jg-00000005adL-04HK;
	Mon, 02 Feb 2026 20:14:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0Je-00000005acv-0w32
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:14:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a76b39587aso195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770063272; x=1770668072; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbVzDr6j8Cnfut/dHFXPjRRVJpGHldRxEVpuedl20WE=;
        b=zqAggLfcy1dYmkTNt/th5OFfhejvZQRxmwhu1QYsBqlP8T1JI6R4zs/gl/KdAd+YSO
         rmc59cz0ryKIB4+wjltlG58+qw+bZTvEOftadrePgZmJnpJvZtCk4mmOmsWWniqgqTKp
         UwzmdETKQFOWU87M9pCHMH1WOlChVID7x24th7E0eWlYSWeI3j6yEGw/izzUBQj9AJFS
         dEd4/CSD0XG89OR7/mfiuJTz94s3DuRBQJEc0hARd6Bc6rNcuHaFJK8Xw4wmpQC1cTVj
         oQ1uzoH1L8JT70zsgK1urdfMhdUF29guRNqw53fPS9azUQlbqfet0hfBNvAaHrKFLoVC
         2P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063272; x=1770668072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbVzDr6j8Cnfut/dHFXPjRRVJpGHldRxEVpuedl20WE=;
        b=HfMXR9bq+XEMARqdCbheIZPZdLGw99p20uBVlsgSaEV9Dga3lmMoFrm2zNO6/HNquF
         Cf3vlYc2JfOmIAXsmiYQ1bOtVZPOw2iYJhUDC4a6ooOjsNUSbu7oixI48ru3qXiEqUh2
         SthPhV+bdAY1LxG01wHzLbDsQRJtnv2lS838uIdKdygf5uEc0GpyI7j2BOZTOAukJign
         0h3ZN+0LJqHmyVAGKYiITf2fZvyrtowZzdi/6vIZbxzizFlzBn/Wo8511M2lzGpldYPI
         JyB0rCqHc4LzIPd4ikNQHJA9mNYat6vP1VhN0AMQBlOw5xObNtDDI1HIuHOolJ8cm3Mu
         ZMxg==
X-Forwarded-Encrypted: i=1; AJvYcCWYFCvYHvNKPoQoiZOlAnU1pU2oFgjAZDl1TbGFsLZngYIAk0xxFeiOxd6SjBzdoghF14NxJWoYFIgOTGoqpQqH@lists.infradead.org
X-Gm-Message-State: AOJu0YzyJW85pqHOTqtlqk2DELnP6A7sV42IYiF31BIGLqzwGeFus4rS
	bp3cC1X5xTlZVIpz2oGXO74BClOuVwm/ryejQnDB8cqzEZk0qA3mC2CJtBcCu4d4/A==
X-Gm-Gg: AZuq6aJYSuhhOQ5NViGEcGCBpn//ctCpLUWWdRFKHZW+EtTb/oDhRNpExc/9REVxsBe
	Pb4rBL+U/U5N2+qHY3TdX97307KnVDuR90HmIDd5Vtujn4DXQxFaenIQE8Iqv7+rYOudUMQj7bu
	wnhPchobRCmRoOBc4+o3LyuLrR7LaDup1nam/fXqdbgKK+7ihldQZdZlf+HuTRUwlUKrGD1dLmJ
	HCQkEEhtkz6Phw5Jzbhsvv+srIqxfeT0a9Ubp5qOXcYq7fuLk37pBn9dDDcqqnxFzz8kQ23+1iV
	sk+7yrewpmCIikb02oRNI8AcXnV0YjwKX41hipKpiDsnyvH9vOBMe6oUWK3rlY+31s4P6DEKYlh
	RN3IR1pfr69HEjSYJrjmarwqQPCquP8infEKgznoSmKoxbGrgAIWHVO1VyCbazBrPxjoiN7pLsD
	cJVHUsTaGBsLGPR5c7qlLlFnNl/QXBrTHY6uBvL39R0BJ5NTXE
X-Received: by 2002:a17:903:1a24:b0:29e:27f4:bac0 with SMTP id d9443c01a7336-2a92546efd1mr619255ad.16.1770063272159;
        Mon, 02 Feb 2026 12:14:32 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm161078895ad.53.2026.02.02.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:14:31 -0800 (PST)
Date: Mon, 2 Feb 2026 20:14:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <aYEFop8CJiLYzhLw@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_121434_262001_B9F83522 
X-CRM114-Status: GOOD (  13.14  )
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

On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> [ +Pranjal as this might matter for v3 too... ]
> 

Hi Robin,

To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
"can of worms" regarding power races by leaning on these differences:

 - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
   event handlers are fully threaded. This allows us to call 
   arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
   the hardware to resume.

 - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
   pending gerrors in the suspend callback before the SMMU actually
   powers down. Any GERROR interrupts received while the device was
   suspended are treated as spurious and ignored.

Thanks,
Praan 

[1] https://lore.kernel.org/all/20260126151157.3418145-1-praan@google.com/

[...]

> 
> Hmm, but then how *do* we actually guarantee that autosuspend doesn't happen
> to kick in and power down the SMMU just as a hardirq handler runs, when
> there's some unexpected event? I fear there's a horrible can of worms
> here...
> 
> Thanks,
> Robin.

