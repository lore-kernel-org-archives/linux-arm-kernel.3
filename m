Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A78C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=; b=j75lyMF+QQB/OMTgZ9ztS12a/T
	khNx/fQhfFc9vxy4Ys/dWDer+p0KB9C+Ms+TBGLUIO88kQ66sb0C39WK3t/IeWDXfFZBif0Lk+jSC
	m9VeWdPV+/9SlxiZyogu3DgAYuZMw2Iu3hkcOJXObYBxcao9qJx7RFl0O/lYvXWPP0/abJ+5O4ga4
	4tkRP97eZxiiEpRM1fPy6HWejc7oIR/kz5siuxVVPr+BcTt71gVfu67iNO91PtggbjaLP8YmxQEUd
	fHFocif3mdgZ/Idw+NsdXcyxlQWkgw0MhpOG48T2PWjai9Q0KZeP3sTBbqv3eV03+redNII/kCRj6
	FVH0vKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdmc-0000000CJ0m-3NBI;
	Tue, 14 Jul 2026 14:06:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdmb-0000000CIyp-3j2y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 14:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=; b=kTv4efE0GmcUs74WCHoR4N9xJa
	078BtFrHXxCSCmAfHyLCI/d9Z3+oE1eoTSOpW0JD9w2m95V2+oqoSh12fonQUjqeA7Oi3objQBFXI
	LXSi9wsbyVNKldIBhLn/NDctkwaoWqZqyZHhy0PLhy0ILjU1I0luHZp3QenqMQT7ju4sz2V/rZBGR
	2FXhcvxb5jYPQrURQnXq5E8XW+My2W53gNGMKsYcpbgH30NFg6hhGjnsL4InqbIlAZgWdknHbCex4
	2KInWC5WKS1rCHc9urstcuOAcDoG652XZSEuZlQEgBJJflEPLCCZ5KIdOG3XMASCBFB9DuAUm2PFS
	vO6SSa5Q==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjdmY-0000000CZCc-3uo4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:06:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ccdf36f63dso135825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784038003; x=1784642803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=;
        b=O40ls3Klx4RbajKup+clUJoV1VYLt5a/HmeNisaIveJdj+d8SZ/o8M9hWuHaUE/abD
         hitAaQAIvIdCiyJ8NvWADZ0pmKg0V2aLgcYEzh9umQ1Y8XffOiOms5VPiYuhaDQMPvQM
         kBlIHdJEQjgMAaMRigrdVyoA0a0mEvcgPfB1077uQWcOlVq5vXd2jZHNt+C59LM7eUXz
         7E7dcmoR+fnd6MnsUkGSL9a6xxAWxUMVmIXNpA6q6iKi/03f49v4Vl9YESOXzvapZrNI
         MjUETqTCl5GEPcKE9sMRVeFjLeLyS7aGUpRd4pvOC4FSv1o6VLwLOxf+rEih/avrvU4E
         s6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038003; x=1784642803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=;
        b=OUHj+U3+dwSZVLUGZmNtm2mgza952DM7RHDt35I0lR7jZQnRT0bz0CEbBEyunBPfrx
         p1rRQ5nZiyeutFk6/86ht6AlAC6wT0RhbdeO2WOojjupFq2esV8nAjTHisR+jiywXL1n
         dnK+H1uzf0k7B/DYB0+xf8Z2XQB0humDCpS2hEfklO4I8KjhnT15gGeTdTxWkJzWUtLD
         mOg3Jpn6mwdDe/5Quynto/hjBcdGk0zhVAVa4nZGF0y6gdsnhqUrEzSRoqOEwz3Epyvu
         pbnkoPrhRli1afSEfhu4LAatsNIxD9S+dTWifxjA6gDoWEpK2G+XKd8Ho/7sI7BQyHh7
         Tq1g==
X-Forwarded-Encrypted: i=1; AHgh+RoHHWTA1BHSYImwJXfWukIXf/Kd9e6oajJqJo3mZqXPUqng1CtlS+52hSQo+dT3Y9MDdjvVUM9jSGU2EZVVC18w@lists.infradead.org
X-Gm-Message-State: AOJu0YxAsBMUj2VDTLklo6a2op87mZUnoyVhX26O+i5QYpU8NqappqMU
	7zgZUKRifLjbkOueo4a4cLsJcApWLc7QWvqz42jKHJMS/3kJywCsXk3TYuezS27fQQ==
X-Gm-Gg: AfdE7cmJywO1417Y5DDTxgyWrQS1TM5B+AMsSDdA1hoVlA6Lxmh06cCXQX4kdmp+dHN
	HV0sPr0R7ayjEwLagKru0jYe5xfe+RViiykFz1oXMdKx+hBHlBUQPcnzTcAEu1OGHlBNZDbFBIz
	snwmuVB4O7GSqPT0kNnatgtJ+ZKrFoGlzc4YmTbpnc0x/qwARCKCNq0Eghsm1oM1oSrK2iJHwG/
	2t1+X4IyCP4LalhGjXGGv2Gyd87P6M2ahUFcLhLJ3N/+o/ZafcYv/mbm9Iwq6HH6IlJICQ4X6d1
	LB+a4A/2yjLnUGdlNxcUXpxdMkeqxHrBFwRF8i6og9fUT3meYe372mWve5qEi6OVaPmnvij6MZR
	IYsEMJT43jU593AvIBcuoWp5LanbXmeFTqFDl0ZJ/hwMWowrLRLY77CAAbGQTwd28JjcYVrg8wR
	RcIZvcv2gmFchAg3XdHeXgAv8cHg6erjwgudt0c2Qmu9Hyn0Q=
X-Received: by 2002:a17:902:d4cd:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2cee1663632mr5888285ad.4.1784038002901;
        Tue, 14 Jul 2026 07:06:42 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e16e1d010sm1598056a91.0.2026.07.14.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:06:42 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:06:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
Message-ID: <alZCbIIuawpugaQe@google.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_150647_271010_D16E68FE 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Jul 14, 2026 at 02:09:26PM +0800, weimin xiong wrote:
> Fix a few IOMMU driver lifetime and error-path issues found while
> auditing fwnode-based device lookup and probe cleanup paths.
> 
> The first three patches avoid deriving driver private data after
> dropping the device reference returned by bus_find_device_by_fwnode().
> They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
> IOMMU lookup fails.

I'm not sure if that's really needed? All these drivers are doing is
dropping the "extra" refcount (incremented by calling find_device)  back
to the state *before* the fwnode function call. If you find that this
put_device caused the count to drop to 0, I believe that's the real
problem/bug. These fwnode functions are usually called in probe and the
refcount shouldn't be 0 inside probe.

Could you share your observation / failing logs where this fails? Maybe
something else is wrong with the system?

Thanks,
Praan

