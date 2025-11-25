Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2161CFD377
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 03:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YPksyG8VS6XaiGbOdFtqdtB/S3Zglc4yuxQFowIScQ=; b=TcgMwtHNlyS4Pyjc1wTbldsBKR
	tAL7Il/1NrI1rGEdo5/2DMFJ0SjkrWHeNvAY9NgWbjZhfUfSlXdVd6OVSEDTTN7kzOujJhdokda0V
	guzSawCyFgwSSQHXfDkH2niQEnxIfnrlIqRLUFaiH9sCJzw1zx83DyA4D6lQvk6IoDiJn0g8yothn
	Pr3XcRrPJjkmeDwpFWWs0YUP1ihbrg8AxzR21SA+t0OOEUkcztKZukYgOxioV8JqssQkTk2Jyc0S3
	ploQ5w7l2YOWudZvwbBPZ9VFzGlcEVe94bwjsy6fG1HUdtRFvSwRJD1J6NbsD6A3LLFq7oFxyuKGb
	2tz7U9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjzV-0000000Ch4V-16PS;
	Tue, 25 Nov 2025 03:45:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjzR-0000000Ch3a-2hOS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 03:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764042314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9YPksyG8VS6XaiGbOdFtqdtB/S3Zglc4yuxQFowIScQ=;
	b=H5vIZ5atOzbIKP2mxS1EL4utIfPn9/L931pUvDwl7yJTo+3/EGb/O8K8fQyxDYikyGTz7z
	RU4Cf0D3Y7ru2JLFbv892Hu2t9CZY42mfuVMKtX6fudUp067K2ms/vpHynloHqzru07dNO
	lTpMNBOIbXQWxv6LW7bfPJvyIksDEuM=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-rzN-o0P4MXyETdJXxWrDqg-1; Mon, 24 Nov 2025 22:45:12 -0500
X-MC-Unique: rzN-o0P4MXyETdJXxWrDqg-1
X-Mimecast-MFC-AGG-ID: rzN-o0P4MXyETdJXxWrDqg_1764042312
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-640cbfa38bdso6168677d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 19:45:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764042312; x=1764647112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YPksyG8VS6XaiGbOdFtqdtB/S3Zglc4yuxQFowIScQ=;
        b=jdPzxZPa/uqDm38w3WgTD3RWfmsTsot03jpJKAICCEY7l1ZMv/o0SMtSdyj3/cr+Yp
         WeOG20IVqiGrZcje11loQbo1nTsRKc5HeWYvoiiBS45MeT6AXyqY/uDii9uEeuzAHfQt
         vY1MbgE0FOFIBrBFwAqqtsOT+YC9nJXzuv4Sv5HVeGrnNUd/o6f5EgQtYXpCEvvtK9xX
         fq8bRqVzuH99ozDxYAhphx0JFvQYlMg28vz4VwuSVVAS6srpsVIYiUFmxroYmet6m+Ok
         Xt9/RzqcNTbAJYQYvIhooA6Bw+U+t2l2tzxdt5Hv6MSFpiFX3txv3qr6gPe+GayLqUC9
         9Ppg==
X-Forwarded-Encrypted: i=1; AJvYcCXlXd3NtaA7l6r4ENc7Ek1bI7pfDC8qDL4rSsaffxyNJ1SNU8qTqvPZD25fL5kvxyLITlBVTl7iRA+JKgtbRzpT@lists.infradead.org
X-Gm-Message-State: AOJu0YxS5c5J1zsdsNKsfN2uHLe/q9pXwAEPsKpPe4lhkw9gsXPioR8x
	y9ri7ynJAtL6nGrFQXlsePALa+WFchlI7cvlUPEx2sb80rrdoBaNW9gSzairZDyt2ZQDBE+61++
	UF1DTW7cyXF/3iMMfBxnTHw87rKbC6uwFmB/kB+hBW16XYNvbUmXu2J7+5X6TkBP3rdOj1hvzLV
	3yUyK+gwH5XXK98WWbBU0NiegwQ0M6vxaMi8ZfAWI7HtZPfUtkYes=
X-Gm-Gg: ASbGncsd+8KlivXAqrplIl0/QVYQEDa0PTHwHI7+mJxhx+3Zy7hqL7IqZLjCkN4w5zv
	Ja5agQmtDK7j7k/GRW8Z7mvA/dtGd0y9ylsCUNAnOtOLsXlBZWCCWP+UfCL3c4jqWYNFp2+nSJV
	c7QdQrIvSLXdupPh99SpL1tirpu7vo7tHaadvOoKsxNhUZ2/Rp+y/KOt3M6KvcynGAnnU=
X-Received: by 2002:a05:690e:1904:b0:640:d31d:6ed4 with SMTP id 956f58d0204a3-6432939a003mr865140d50.51.1764042312245;
        Mon, 24 Nov 2025 19:45:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXEtVGxzeNE6P4faHGlIK/5NjcIgw3FE1TfcNQo7Inq1bmL7DUQz+7oN2BHybx2JJmCAxSNPCHeyCpAWtWEI8=
X-Received: by 2002:a05:690e:1904:b0:640:d31d:6ed4 with SMTP id
 956f58d0204a3-6432939a003mr865126d50.51.1764042311835; Mon, 24 Nov 2025
 19:45:11 -0800 (PST)
MIME-Version: 1.0
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
 <aSRf0doyqsnYk3RO@willie-the-truck>
In-Reply-To: <aSRf0doyqsnYk3RO@willie-the-truck>
From: Luke Yang <luyang@redhat.com>
Date: Mon, 24 Nov 2025 22:45:01 -0500
X-Gm-Features: AWmQ_bnDipnSdqAfE_RGHpTAqoCW90QATCyA9TqrFVIRYN5obKxNbBRUcVwe1D4
Message-ID: <CAL2CeBzYkr-i_WTF_pF9QrqO4K8BE+Z7D8tUY_M-HJGwZeSUUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for
 I-cache efficiency
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jirka Hladky <jhladky@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joe Mario <jmario@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9285ZDdorbUeWEKjg4l6lpMOG8K-JRlvQ_6Qb4egLM4_1764042312
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_194517_778445_05E3B6D6 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, 24 Nov 2025 13:38:25 +0000, Will Deacon wrote:
> Hmm, but what's special about __arch_clear_user()? If we make this
> change, anybody could surely make similar arguments for other
> functions on their hot paths?

Hi Will,

Thanks for the feedback.

I agree that the precedent question matters. In this case, though, the
irqbypass change introduced roughly a 30% regression in /dev/zero read
throughput. That is a fundamental primitive that many workloads rely on,
and the regression stems from an unintended shift of __arch_clear_user()
so that its tight zeroing loop now crosses an I-cache boundary. This has
also persisted as a deterministic change in performance in all
subsequent kernel builds we have tested since its appearance in 6.17.

The proposed ".p2align 6" is not adding a new micro-optimisation. It
restores the previous instruction-cache locality that the function had
before the irqbypass reshuffle. The cost is very small (up to 64 bytes
of padding in one place), and the bar for applying this kind of fix is
correspondingly high: did an unrelated change cause a significant
performance regression in a widely used core primitive?

I am open to any solution that reliably restores the lost IPC, so please
let me know if you have something else in mind.

Thanks,
Luke


