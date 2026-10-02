Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FA5CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8FgFfsrFu7NaKoGhtbGJNDz2Gwi+BLzqOzLKsff8ag=; b=ebLrzWpG1fUH8PAqmheceNEUYG
	qIHZyySjd6VE0Iy7sbvLCpykBczzbITcxdK/FuZjH9K0bl7Yu7lqKLC+0gHgpDJiB5kSo/0ip/Udb
	lB21TX7FvtfHV/1stOKQG/7lNn1hHqO67xR1gS7EoT4GOpIUl7xb5WhCaMbEaoQV7y9XNrtWn1UdD
	sv6bZj4nn0FxaBX3ceieOGs2LBGbP1nTEpZ0pQYmcYDgIUv6l5i2SDc2Zj5H1cvCG55nC909bt/3Q
	s2HvLH44j0x1jjRSW7CRB0PPphoPecW0xxYpVQpCC+LbmghaFS50ZKPqAMLF92GWs/4CPhBeMEKv+
	haRelohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgQL-0000000C4xd-3mVi;
	Fri, 02 Oct 2026 16:47:53 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgQJ-0000000C4w3-2bgZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:47:52 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd04edb5so2117250c88.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790959670; x=1791564470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8FgFfsrFu7NaKoGhtbGJNDz2Gwi+BLzqOzLKsff8ag=;
        b=EjghGKmNwQPqNMNYUP/SjE2yJlcs89DrVFFoj16TPkeIkb56cjCEtaHNipZ8X4xmmi
         ZbxBsHxS6Pwa89q0Wz1fHswhyIQbPO/UHdMa9MpFZo4nu/sdEviwgx7VTnRd57R4ii7/
         MP2dhGnfLAbPbGF8SqiWMcybrpugUExcMfiL3VH7bzQhl+SYvIbLwNXowP9MVtwSZa+0
         CVhtTa7B6h5KZHjilpGdXw/srSQPzNPaH+8bexAmpBURUSh9Hyt3hZgw7oeUQHRsYq7m
         Klk7UCMat6a2KeArdI+ssf5v32Nw/YFh2gGyQiOHfnc/NrsKwt59T3zqpbSo9BtmOux4
         L8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959670; x=1791564470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8FgFfsrFu7NaKoGhtbGJNDz2Gwi+BLzqOzLKsff8ag=;
        b=Au6dvFN+TSMBJamEkRXWxWttaIj+JsggvjTdhClavZzCW9mI54GVf6BvdKIjqinL9p
         H6JhnhP5U46F7NDZyi/bccSORrJC2T4AUKPrafCcbmQx9RT+EQD/Zzc3pNhA20yCBXo7
         vcmZcoXXTvwdx3yc9ZJiErsJUrfbp5TNYqA0i5Nt7tcuujASCPRAh/Nc/SEGcM/2OlUn
         Ud58MrbqNbSCQsQc5JoV+Fy8JtmadRqk6NIwtYsAHw9L/vx62yId8im/2fSPXj8+NdfB
         d7QoCUTizuOPNCsM1Dt75gMlSG7UGIH2JYA9QxJtaa+KROmgQR+k9TzY7TfbCpHinti2
         KIRg==
X-Forwarded-Encrypted: i=1; AKwUvByPy5t3nsZwCgFpadDe7ByKhSYBu5JkDWoMSyBaKvJSnucpy1ecXCI6kl0GClXSemW0l/Kq3u/yS4/rl28tPjhT@lists.infradead.org
X-Gm-Message-State: AFuF++lQPCkVU1rcSvvJvNplUdB3UpW2NMwweBcBj1K+NZ6FyuDtQvyD
	Udic5PZUjXbuBk880OifY9st1V/g0SYxPDVj87BStMdkDOOnqgNUXDhMxAmeyunqfNw=
X-Gm-Gg: AYBFou3WVqp7upf8QNXZ295uQVFMtoFLEGpGbcdKUtVliOx+9D/ECLrMsjelyDuIVuB
	RrSEQYItXTV0It6OtgEGuYOuKEfyisAeyRzfTPZwLCyu4+n8sppHKDPpi+0WGI01kbvn1zcQqB/
	tLQ8U5XXvjZwHQ8hnXQe8bYZ9jv584o4AhGdE+xNpOC/rI0PWI8LDhVdqXunaApOUWova+WdaI6
	bvtKqaEtEcqwyYfiLU+yF86g5a4TMforXTpmjFcFZwg2G6A/Vd49xiuYBSmG9AWT/SQ2849X18Z
	9i+DEwt9vTUtsHl3j6pTy8+o9ODAVN0nvomyZuolz5c7VPwzLSz0+Lu5RASFnvwcXSJ+i5RAfsP
	4eAGYtb91ppAKtrVTqB1eiQdDAVg6INd4/g124BveGoYdJ9bVlx62P8NEw02qR1Dh6h0V6wCHyg
	0hQpU81TYCSxtlROFSNS40KmY79YHlZ/kZ9yvfkGbLot1h
X-Received: by 2002:a05:7022:5f1c:b0:146:852d:60b7 with SMTP id a92af1059eb24-1508932185fmr1788544c88.8.1790959670092;
        Fri, 02 Oct 2026 09:47:50 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fee0afsm8489793c88.5.2026.10.02.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:47:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCgQG-000000008FP-19Pb;
	Fri, 02 Oct 2026 13:47:48 -0300
Date: Fri, 2 Oct 2026 13:47:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <20261002164748.GD3481470@ziepe.ca>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar6gY9grmdMZcN/M@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_094751_740160_8D1E76BA 
X-CRM114-Status: GOOD (  17.19  )
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

On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:

> > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > during resume (the SMMU resumes *before* the EP is made active). The EP
> > can't use its ATC while suspended, and if it loses power/resets on the
> > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > back with an empty ATC.. same assumption the PCI reset path makes today
> > (pci_dev_reset_iommu_prepare()).
> 
> In that case, would the STOP flag be too late? It's only set in
> the middle of the SMMU suspend. So, an ATC command (via doamin
> invalidation) might be issued prior to the Point of Commitment,
> which will be timed out due to the unresponding EP?

How can you ever fix that?

How does power management really work, is it expected that the end
device is already quieted by its driver?

Could the first step in power management install a blocked STE? Then
we don't have to worry about ATC desync and that automatically stops
generating new ATC invalidations if we go and detact the domains too

Maybe I'm wondering if power management should involve the core code
so it detaches all the domains from the device, setups up blocking and
then the iommu itself could power ofF?

Jason

