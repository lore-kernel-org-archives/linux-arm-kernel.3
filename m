Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D63CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eW2e8p73Sm65C62B3d7xoYycH9WMEA7fbE5AMLTODfI=; b=3DcweLVGjo+JH+lkrC3X6IxtyE
	Ejb638Pc8bvSqBl5Vb81c/PhCPCAlm7aGOsj7UzrKhVbZ4EEIFLUMrhgYxMRNTDBFiYL2XC3xOQUa
	UVGcGQs/hDW6BmRxiG3+tJHAlC5tmXHFlOBi18A51pS6G4awQ6qdEgUFaEpfOWcIXoEXY/ZPRA9A/
	put1TWXGQwbWkSnJjin+FZZ1qkTaaMcgsq0H435fPKuUt4HoH4MgqMmbcsvPAbQDga06JMmrf6E+0
	gm+nB6VbYTGUW/ENAqb4x/8lsCrdumojG5M0aLw+nl9O+mtXpmlATxxOnB58YWlpx3o/zMXznMSie
	Qb2Iuv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOHi-0000000Fh0l-0HI9;
	Wed, 10 Sep 2025 17:07:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOHg-0000000Fgzq-0RGA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:07:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3dae49b1293so3635464f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757524021; x=1758128821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eW2e8p73Sm65C62B3d7xoYycH9WMEA7fbE5AMLTODfI=;
        b=FNEiKjorbKzR8jfEp8Ev7kt99ifO8y7CnYWupWD0WElmNuTwmpiopzqI8t7Lt3Fvm8
         TjTYFSq9SWUmg+jjE/yeEcTkDKg9p8NVEutkRjeMHJfFQeQcOACz3cdCTU1gxWiXsx89
         h20Cb7yvRgBMLfpRRy0A6IvXZwJjxv8Hm/DGGr+6xWo4gVoA2kLGcVQ8j5Ha5my+2vgQ
         vAegU/Ah6l//rcLKrqDxjNOMxMtgyLetdD8tSZ59vQULaP6GzJXIt4Xi5UgQfDFTw9Fw
         X2/ip773QY8/fVGLR7LAIOV09IwTUoL4Zsc/aPN34rU3lKo39y6ot5dBm37cmhKDvSQW
         T0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757524021; x=1758128821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW2e8p73Sm65C62B3d7xoYycH9WMEA7fbE5AMLTODfI=;
        b=HFbL/6m58t26aWJ8A30wCrw6Yqt3EeYW1fpjzTRIALHQbJkENQe+Ny8SiEpT0Mn51D
         UuIdX+ethDrzDNP+l+ska239AqA/YfIlBaZGaMQR9E93i0YSAwkN+ZWFDvwBi9R2cvun
         BsR//WNd4VX3Xb4zNs/anuTUwHwRs9da6uObh+K/a8bEm5t4h8dl3Z1yV7/NMEc5bgco
         3XAE6AaXaKLiwuCF0Bla/5YAaKpWDIAgw80K4n19otEfSET0fhCAg9tp0eLVgVE3r9Db
         zOgutojQ2crb3KfsegfbShSl5ZMn5h5aPGQrZ6Bp/AzawE4MVb7o73wg+ej+AvbqSRco
         PvdA==
X-Forwarded-Encrypted: i=1; AJvYcCUitO99n4oSX7QXqR6eoOwlMPAjvHITAso8+bWRS2XRUG1Z9YFeulCKQPr1tT9YzEg2UZGXk0Qq964Zt5Taoyus@lists.infradead.org
X-Gm-Message-State: AOJu0YxhynB/2lfcAuYS4n7UO66FWXGA1zxygORESuL5vaFbo7iGCeHe
	UIxo7ErVPoXDq0R1At+O7VFl6Nn5ZsEtSntLE0Nc0RCQnA9R3VMWThvWYUtZvuRfVg==
X-Gm-Gg: ASbGncu17LusXoFmF6hl7o4Xad4qB3obKvT+Q0F3Q8ZLwm3RlXy//wIK+/AYwJGxfAq
	akmo5Y6OA91Q0JuQSesCGcCoteSRqVwUIzpgocFT2unD3NpGn3K3+0LJDF/jFPWlhSO49IeLLHa
	G2ZmbGAWETCoSc7qjGmCN07w548ES0Y816H17pITCFaWo/+Z7gIH/PqOfgIdnuKReoTeWcx6hr3
	1478Ur/QhtUT6C8rJwWzusuBC/thTIqhd/XmH62Jb+8zH/m2OETkCwEmlETcY/OLNQ7qIwWNEdQ
	MbI9KHoOArsAM1amDg1BSDjLBZ94DE3njB/GqQ1NkPv+yMOmvTZMiqLqXgwGv8wZS5NuGh/+PAS
	//Bc/83lfreSkZRouxP8SlbEZhSeuengUrVYIJwIyhyafFMf+rOm/NZM5kB+R4uyTz3CVZLrCTl
	2ZqrOTgsOfxD8QM7U=
X-Google-Smtp-Source: AGHT+IFpMY2LdotLVzenSyom37/MyUBFp2vGP8SWQXN5ZGAgsTxLPg9ujzG9esizRfQMqbIwV/AfZg==
X-Received: by 2002:a05:6000:2f87:b0:3e4:f194:2872 with SMTP id ffacd0b85a97d-3e64317ef24mr11131229f8f.31.1757524021156;
        Wed, 10 Sep 2025 10:07:01 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247c3fsm34826185e9.11.2025.09.10.10.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 10:07:00 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:06:57 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/24] KVM: arm64: Support unaligned fixmap in the
 pKVM hyp
Message-ID: <aMGwMQBwxRPPiCer@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-16-vdonnefort@google.com>
 <20250910124742.34185645@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910124742.34185645@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_100704_148965_F090454E 
X-CRM114-Status: GOOD (  12.41  )
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

On Wed, Sep 10, 2025 at 12:47:42PM -0400, Steven Rostedt wrote:
> 
> Would be nice if the arm KVM folks could review the second part of this
> patch series.
> 
> Vincent, I finished my review, and you can post a new version. But it would
> still be good to get some input from the architecture folks.

Thanks a lot for your time! 


