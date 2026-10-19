Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E45CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=; b=dj24YWBeeQ4e05YUW0Z2wG7JjP
	AtRlcrVWd0MZYdqjrcXuU4GRUnOJBmCfBu9QodtMQXuVrHEsrtW8ZopS2LaNmUCr3DHh4toFxB0VH
	J4MTFEfk6C8v5R/iwLAkd2VBHmUlHH4V5mWiFdDcTKqUUAirbVNhfi+v9AGqHf7hpuCR9sCuKNBvG
	Ijdn7eto1chlCxx8zUl3c0EqdWm62OAhGz6e7o+1Na5hHw4fnl1Qod9hokKDgodmWHHPRWmgOJR/O
	JUwetuuxyjOOcqFUuNLy+7xZ8BMfRPKE/+QqQKaTuDZomcHb+3B6UAllU0kHeQF/u1HBjkbwUciSI
	WsYCfj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOJ-00000006pF1-0zbX;
	Mon, 19 Oct 2026 08:06:43 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiOD-00000006pC5-1kvl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:06:38 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-169be2dfbacso6617c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397196; x=1793001996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=XLl8NEbnRD0VtKVfo95rTxMqvPoLgWVgKbO06Ryg4kU/qH/YidHnyDgRJBIHC6q4eG
         4Fv8Gybvh4+OQXee4Cix6lZ19pwcJ5ZpnS7oNOirGkUjgBPQJ/5FSKjuGmn2C+FNZCEQ
         n9xKF+gdIvX01vBCxaCpyR5i41U62PhUMCHl3mQGtjDMuSeOfy9Z4FdMSkUDYT/QN3Cu
         rxkVjgUWDSCYQn5w+CgksHnFFEJBAeYhHOCX/B7H+Aou5/tCptLPOJkXPcY2Cq3KPbsK
         SC+i/OGAtbqLLP/LMUXWMYLja3w/mNenH+N+dMj/xuXp4R5EZIPcB9CU+DTjn4O/mTUH
         zRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397196; x=1793001996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=cVTpNiRDsd+w/2gSJIb4rXqIAByIAtZlAOMvBSg1ZlzbXF1l1eZ9XFbfi4dNMg6qKO
         6IgDCzqd+xXTE2QIWJYbLQYGme4aHe7gK4JILvD1Gf22T5XqrNpPlj0efHJ9MttggSqd
         zfEtQPoNIkBt++/i6+ymDhj0CKDu6OCGFt3KONLlqpN/nwMI62vgUBHvIm6eSusvWNkP
         nxSg0+wQy4bj14RHxhKMv2GB+nR8Y4q96D8/H0GrqUEZr6XDJKyV0rRk0L798TaP77fi
         mhqIcNHAK5MtIiun8TX9DbN3TxakggJdzRXH3bLQPJM2kD2hnq88bwtXWGvxwHvhI7LT
         QpIg==
X-Forwarded-Encrypted: i=1; AKwUvByy4gzc/5+jxKoqMSskamZukjSOXP1tKYz7fn9MhGkrpNhFJqEZj1w5ijyr/EQdqkYRsDgjsICh9GoO8oWeDWCt@lists.infradead.org
X-Gm-Message-State: AFq9FYJYMVuwO3qsfD02xi5jlKmAsGdJUZcbs9kTM2l9EV/PRjdQpjtY
	iQLy7/vHMYiTR9E5KV5PvOovKzfxCtEVvmYX9x/wnyF7Pc+05RL8K96R+nroFWLdJw==
X-Gm-Gg: AYBFou3RBdBqv/j+DRuSzsU+8laBTC88IHa7Lg7hreOwhgM/Pdgto1A1entEFl5OV4L
	H6TADwGiQJPFgg+ysbY2DExrbHXcmNZggmTB0zN7EBTRRtLX14ylNqNvQniV/U7pdG4WYcgEjRL
	s7Bh0Zx85uUJ5IdrArHUa1tgmsmDUyOLpTu6JEfH1MkQLXRT9LSCzGHEWAX0HmD/GOvzHyWKMR2
	l6jcJbk6zyS1TchweyLFYR815SN6+CNLpCUOllveMaDSudFxrKVMLhB/IwwSrshz/LzL+iuMW7v
	C2BB+pIgYW5XGEjzvOk3kmzWjKwysnqxushS3mZ3M+8anJQs/B7+VLu7/422u7whjRbX7MA+l7c
	btWHrXuYpCNBSzfu2x2IdvST9qc+RTxtMLaTVeC0gqwl1I68mIjrH3sl2+CubW30J1ERcj7cL/0
	DgYt6VW9NVA7U65eBR57oKrAC0OUxZNahtFkpoNPII9vjHVA9cdOe2CDdt1dI5BpCC3fmzCytot
	TQMpbtRM8Ehx//d29bHCpKIiCi1vgItvHhib28hzWnHk7A=
X-Received: by 2002:a05:7023:d0c:b0:184:6afb:b26c with SMTP id a92af1059eb24-185b79b5548mr344812c88.18.1792397184354;
        Mon, 19 Oct 2026 01:06:24 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm28999611eec.26.2026.10.19.01.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:06:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:06:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
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
Message-ID: <atXPdbcX0XADEdh7@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
 <asAeCz_rmpe5hbsh@google.com>
 <asUvUf4PZJ7JCLXp@nvidia.com>
 <20261017174912.GK14213@ziepe.ca>
 <atO7jTV+XNReShT+@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atO7jTV+XNReShT+@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_010637_498513_C132B506 
X-CRM114-Status: GOOD (  22.51  )
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

On Sat, Oct 17, 2026 at 11:16:45AM -0700, Nicolin Chen wrote:
> On Sat, Oct 17, 2026 at 02:49:12PM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 06, 2026 at 10:26:41AM -0700, Nicolin Chen wrote:
> > > > pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
> > > > suspend/resume?
> > > 
> > > That sounds right to me, though a different API for suspend/resume
> > > will be required. And call them in pci_pm_runtime_suspend/resume()
> > > maybe.
> > > 
> > > Jason, how do you think about this?
> > 
> > Maybe lets just start by refusing power management when ATS is on? For
> > PCIe devices too?
> > 
> > It isn't just ARM that has this issue, every iommu is busted if you
> > suspend the PCI device while an ATS domain is still active..
> 
> So, should we put that refuse guard in pci_pm_runtime_suspend()?
> 
> I am thinking about splitting the iommu and pci patches out of my
> smmmuv3_atc_timeout series. They could be get merged alone.
> 
> Then, we add a new API for pci_pm_runtime_suspend/resume() with a
> new BLOCKED_SUSPEND reason in the list:

The guard doesn't sound too bad, but what if we refactor the reset APIs
instead and use them from the PCI core to disable ATS + flush the ATC
right before the EP suspends, as discussed earlier? That'd fix it for
every IOMMU without taking PM away from anyone.

FWIW, AFAICT VT-d and AMD-Vi already enable ATS for ATS-capable devices
attached to the default DMA domain, so a blanket refusal might end up
disabling RPM for some internal devices (e.g. dGPUs / NVMe) that rely on
it today.

On the PCI side, I could roughly:

  - Base on Nicolin's split out iommu/pci patches (blocked reason list)
  - Add a suspend flavour of pci_dev_reset_iommu_prepare/done() with a
    BLOCKED_SUSPEND reason, i.e. RID/PASIDs parked on the blocking
    domain, group->domain retained (so dma_map/unmap keep working),
    ATS-capable devices only
  - Call prepare() in pci_pm_runtime_suspend() after the driver's
    callback but before D3, and done() in pci_pm_runtime_resume() after
    D0 + pci_restore_state() but before the driver's callback. Same for
    the system sleep (noirq) paths
  - Keep the guard only as a fallback, i.e. -EBUSY the suspend if
    prepare() fails

That flushes the ATC while the EP can still respond and stops any new
ATC_INVs to it. On the SMMU side, we'd then never see a suspended ATS
master with ATS still enabled, so a WARN_ON_ONCE() at suspend would do.

WDYT?

Thanks,
Praan

