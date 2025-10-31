Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC86CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkjrBNYFPQuOZFOAGb73yiSJLPG6mvvoPAChZEa7/NY=; b=eCaGvcGvxd69XNDdLAYgJUmkHJ
	GIn3Bl33qfJ4ytXMJjl70Pgmvgi+BqtcRWPSMaq3FhmFwb9aYZlFd7EkQkTNzwct4wqygQAHG6reo
	Mc56V45BjdZ9f1Nda69ezk+4Bh42rDLTnCjSgxz3assI+bYA21M6unAEuPknrH2ocQJOuVgMD00Jb
	qntH1fONxpwLnsC2DnCXvBdXegvX8RkzYSOa4eiSU7g8eqUwgCVx2NtGfVwVkioPwYTAxGtSg/L/V
	Gkpbl/sctOw+I+Y5P1qb5P5YL41YXoOwHR3Acei7b86k+CZIknN+g/KEhvgG0BVw5cFOV6ooZ09L1
	uFb5MFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEu1O-00000006dge-2ALf;
	Fri, 31 Oct 2025 18:38:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEu1L-00000006dgH-20bf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE534028C;
	Fri, 31 Oct 2025 18:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A25C4CEE7;
	Fri, 31 Oct 2025 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761935922;
	bh=15E5ci1sKkWmYweiaVDjg/8xeqjQIU5DkH66QuBZWaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qj+gzO9znW5xDDYE74Di489ySXv22EKDscNMyfXckAJeuDq2I1lWEZCIzkhy4u9TS
	 Fy1ubpPoCbQELwfgIComEQhr8vKl44DP9UVhPT3l29z4DN3J+9Y+qI7yvtkMI5lTW+
	 +Lf/LTd/BIPOVEO9hFRDCYW1GXcAlTFHmg3HP3Ap9NM2kurmqcnmcsyKg7V8kqN3px
	 ZXOJ732KRrHPq+dsqd+9MoK+bvlDQkvnNrXa3rKP7j/rgwPlFsvCuFXbAUz8Ada6Qp
	 53kd+Zia3t1rEsQ+S4bl2DEAoHEMQnztW5lAjvVO2lEgtSU6531+GMwR7RFq+vbdRa
	 iRtR+ZsZJegTg==
Date: Fri, 31 Oct 2025 11:38:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sudarsana Kalluru
 <skalluru@marvell.com>, Manish Chopra <manishc@marvell.com>, Marco
 Crivellari <marco.crivellari@suse.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Sunil
 Goutham <sgoutham@marvell.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>, Jacob Keller
 <jacob.e.keller@intel.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next 6/7] net: pch_gbe: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251031113840.067ef711@kernel.org>
In-Reply-To: <20251031183525.5b8b8110@kmaincent-XPS-13-7390>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-7-vadim.fedorenko@linux.dev>
	<20251031183525.5b8b8110@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_113843_563552_80C436AE 
X-CRM114-Status: UNSURE (   9.12  )
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

On Fri, 31 Oct 2025 18:35:25 +0100 Kory Maincent wrote:
> >  	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
> > -		adapter->hwts_rx_en = 0;
> > +		adapter->hwts_rx_en = cfg->rx_filter;  
> 
> It seems there is a functional change here.
>
> > 		pch_ch_control_write(pdev, SLAVE_MODE | CAP_MODE0);

Good catch. Looks like SLAVE | MODE0 translates to 0 | 0
so presumably the device doesn't actually support timestamping
of V1 L4 SYNC messages? Unclear what to do about this.
Maybe let's leave it be? keep the hwts_rx_en = 0; ?
Not strictly correct but at least we won't break anything.

