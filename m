Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF486CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr3wKIH0ILNJrROQ8e7R3YmlW6yepWJRJ+67Lc0p55k=; b=Xn6DDybaY+2tpeIIpfKHx5B2/P
	QyQjRlrOY6erqOhpsfxjET1Kf5n+88R1TkCqn1jZCjp+NvL1TCN837BmhSwMNWnnSoKhboyW1i0oG
	i1f4RX/4Z0ZjFIaB/CtuiHe/cgsqRAla+EL+8ZqIOPCI0CoYhAfmAB/VWkx/gGvlQcuYZUEf97BhW
	cMI8BbJ0M8EEG4iuy1hcMyh2TaSv0qypeGDLceN6y+2PlK5Px7nrN8+tIHecrbUdw/ztoNuYFJjvl
	zRNleK7GEmFTtxRGah/ZXrT8xvEK9LA8W6OS5gGbFgDqS3EkK1VsBozeb8ln2war4mpgX5lwaCef5
	HEmm/q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umixL-00000001143-0qNQ;
	Fri, 15 Aug 2025 01:10:07 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiUF-00000000vpy-2mJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 00:40:04 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-435de7d6d05so905290b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755218401; x=1755823201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr3wKIH0ILNJrROQ8e7R3YmlW6yepWJRJ+67Lc0p55k=;
        b=JOCI3ZueCaPW+fv63NpNNtr1gJP4UcPvARJrIGagpm7lq09OTj0QRVVL8M6LVFDdQP
         xxs+nTnGobGJBjMd7zcqs5ll0WpjhnF/BuvEacFLKMqWHlFTeLYGfMVmGINxY4CXe3Eo
         fYoyTfRJMYK7JoT8DDDJrk6/qsYbm45VG3IftxS2KcZkBBJCckUzxPMcElOV+CDNsSZD
         gfsQPYGyPhN6FGcvvLYTAC6WetY4rpyrHmbMHtrsZWfqjyUfoEqPR/W+k+gsLZbAj0AI
         tI8dxzLwi34Cu6YwoM4m8Nrp7SPsdeLqPsmgNg9OKPIlyKYc9160fDSPitJWJIpdrLPe
         7nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755218401; x=1755823201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr3wKIH0ILNJrROQ8e7R3YmlW6yepWJRJ+67Lc0p55k=;
        b=rAi2mYAPuYcDTe0rgj6iVOlXDx4Etd6E5CMjW4PqzpopG0snrz7k2VF85yMFWunFpM
         QEzpLvT+xRw84dHmowqn36cjTw7nCz6fIJviXywMst7jos6Ay9VOrIXovunkjINimD/l
         99MD1F5yf2z0XykJJq+1TGEH9Zz6O4qzCc5Hn4Qn6yRjMiMwoiCHKCKAmFAdU3jcP1XM
         5z0tKSW+v+Rl1K495byoKGQs4N1sPeecjthVvBXvh0/GnQeA2uG596vFKtFM7Yn1BhyC
         Vkv7GMXZgO1pdP+Swlw3nxU+IoZfENvwpG8aofDUm30ZJJFzHC/LpD8qlBQ9/cDo6D5k
         QvOA==
X-Forwarded-Encrypted: i=1; AJvYcCWROlD8dIEIcturPIxE33d7XKPJ6je4ikZFUaSccG40/i943fTYr3rJsOyViO525VPxj+ySTKbv+/jVRcwBaGcL@lists.infradead.org
X-Gm-Message-State: AOJu0YzqrVbfVjAfqtpQteRKahSye501guQHtoInaZuFbJrBZby3bgyJ
	PoZPsrCQk8EoVpSXG/oQn6ItXZ1zeSi727jIQpJ1mw2pUQmYvE/m2Oa6JU75vTJDzwI=
X-Gm-Gg: ASbGnct622mVwwg4z0FJbns63TTR+Dsru6W94B17YLMrVPtwz8Cc7UVquLU5oS6fZWK
	nk7mhgXrekqkJrCz6dSD6TQoWeCZUV7aeWeZF0acnb0c/0Rhr4Tfqb37PDVw+qWtts0EDJwWlkq
	TfK75+IklsYRNXBDeHWxaSxif6IdPtfxBPDyd2qXAf3EKbygPdUzI72TahGUfhWfwjWtWzh2oCr
	giZVOzLgAYl1qmaAMoNIObhQs40vjNoPC6l+ZAxrqL8vsfZempNImV05hfQpeLGg6nqLZms223v
	2N5jgW9qg2e4RQZ+SHyvlrR5VG24JQbjGBar3rPs7yWhfVRKEJcgWsbrL6vsn7O31uhm0AeR
X-Google-Smtp-Source: AGHT+IHz/V+zZ7uzfzwx637Ui4sGjmYjl6eL7eDG1gc5kCGFqOg5QIIhe2oPTd/JaDh2sRuwhvdoeg==
X-Received: by 2002:a05:6808:1a14:b0:434:54a:40bc with SMTP id 5614622812f47-435ec3bc7eamr73006b6e.1.1755218401405;
        Thu, 14 Aug 2025 17:40:01 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-310ab87a099sm3458fac.1.2025.08.14.17.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:40:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1umiUA-00000003TLB-28WR;
	Thu, 14 Aug 2025 21:39:58 -0300
Date: Thu, 14 Aug 2025 21:39:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, robh@kernel.org,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250815003958.GE599331@ziepe.ca>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_174003_810469_30BB6F74 
X-CRM114-Status: GOOD (  13.61  )
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

On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> or were you referring to [2]?
> 
> In that case, the PCI child node data needs to be parsed, which is
> currently handled individually by each host controller driver.

Yes, this looks like it may be what I was thinking of, the pci@1,0
specifes the BDF effectively
 
> This might not be a strong argument, but since firmware updates tend
> to happen less frequently than OS updates, any addition or modification
> to the FDT would require a firmware update. Wouldn't it be more
> maintainable to keep this logic in Linux, which is easier to update
> and typically updated more often?

The DT is supposed to describe the HW, if the PCI device has an issue
with its dma ranges then it seems reasonable to me the FW will use the
existing standards based way to describe that issue?

Presumably this is a fixed issue of the platform. You never did
explain how your system has such werdio behavior, or how something
like iommu=pt can function on it...

Jason

