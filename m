Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FF5D3A66C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7tZlOg0pwjRx/deBLM4U47RySvmObKDNAr57zEyDXU=; b=v9Q23xGBRm+BVRBxLiFmUBrYvP
	BxQeCQtmQ1fmM4BNIs7bqF5K8qDspBfdv+Oj1JfUkECHaWmkcnUuTX5fTOGv0Mw7aQeQnXB+SxtXE
	JLGp+oEZh4YkWUaGUJbXkHHf7/ysKFwRTQm0cV/+/LWuD8+l6uvPgWT1xiJVh/uClxSKHtmWKLfc0
	qIKiMxepje02irf/6wu8OfmDjnHBG5u31wmEEKu6/ASB2pk56lyMmbuiDUL1Ry40CgpUCIcuzIEYJ
	qJxVyIOw4dVceTSPiArC0rVoRUn9lyK5ChTHp7krwFYPYPvuW6va31g/p0b4H/58uczjKCm/RZw5Y
	3+KOlXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nya-0000000EsFl-0oQ7;
	Tue, 29 Oct 2024 15:17:44 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nsd-0000000EqiN-2jGy;
	Tue, 29 Oct 2024 15:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730214696; x=1761750696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2q5KKYy4yeTF3GakiePokmKgbkxH6oTt+zSdu1gzpXg=;
  b=kmP88U1v2b4/12KwJ97fB2yRhKt0poHrnHRq+0TxXxiBCoq6QhGXKQ8M
   F5uV01zecvducd8JtcZSAFWf9DAbGEuaGkf9ttOeIUJjSy2Ng4L5h8b1+
   U6d8+2JInu3RCvzgMqmHLmKLgeqcx7L/H3QtW+Vf3ESY4X/8aj7PulYgr
   9D2B6sdgvkySolESiy8dLN1SnpXprwb6cyNsUicB6Q0jwGYJ6ynMOMkwh
   Eqqgr7xiqVlaL1i+ViqNp5TziYiPeEjYvmbhF+swvLSIJYna02Kcu3nIV
   GhcUfL9/Rks3BX9JzbaYJidVMpGGL06/+b0yu9+a7rUFUER/dGtjdcdYZ
   A==;
X-CSE-ConnectionGUID: RK2IBQwbSSyw1fa3EX9XQg==
X-CSE-MsgGUID: rwMswBQ7SXOykNkeuPGV0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30000430"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30000430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 08:11:34 -0700
X-CSE-ConnectionGUID: MT3LfDL/SCukJ7cmlaApYQ==
X-CSE-MsgGUID: pXGasDdnRNiq0RtrfeDzng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82058303"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 08:11:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 22FF526B; Tue, 29 Oct 2024 17:11:26 +0200 (EET)
Date: Tue, 29 Oct 2024 17:11:26 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eric Chan <ericchancf@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv2 0/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <j54jizfjzubkejbkobyryl33i4ejhoek4ynshtethkiidkx7le@2p22g3fxxedz>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_081135_797426_9AB9A748 
X-CRM114-Status: UNSURE (   8.44  )
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

On Mon, Oct 21, 2024 at 01:57:21PM +0300, Kirill A. Shutemov wrote:
> Make memremap(MEMREMAP_WB) produce encrypted/private mapping by default
> unless MEMREMAP_DEC is specified.
> 
> It fixes crash on kexec in TDX guests if CONFIG_EISA is enabled.

Ping? Any feedback is welcome.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

