Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB2F8D779
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=273J6d2bJPziOOvJNbT/yeQhqND2lcrjyhTAhjAjRTA=; b=44MzrnavSNDtjn
	iRirZqrmBccWB/p5/Hk+tKXeZVzX63uy0Sa6vsWNaqBGQ7A0jBHkSEIK2wiijwh/551iJdnt6GDbT
	9XW7WFhIBiC7/TdiBBJCX0T2DmcCb+Ge6+mS8Jty24C/4loBY5sfj1wtszo8u7NX+uysHNm2qX/FB
	pzmUZoDMlYJdFxunodW1Cnwo5TXqduk7XxOK1Pk96QB6aOW4in/eYnFAz57URaEkb4imPNCI2Is5m
	BngzA75w56qiZYOeKa8ggM9oAr9NuuTGHLq/whSBV4X6LoEZuhPqaD5Q6DFNLuznktOO1lMF+POAe
	6Wsv1YZ2kguVxu3zpnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTUU-000000030RL-0SVm;
	Thu, 16 Apr 2026 20:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTUS-000000030Qm-1KBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15969401B0;
	Thu, 16 Apr 2026 20:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC9FC2BCAF;
	Thu, 16 Apr 2026 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776371946;
	bh=RhBffrmsMOEQ9U00Vb6PjZXRgwm+dO9ZID94mEWA0Ak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NIC+uZOPOTFu7mybYkK3oTnc3bdL2r8txodTtcrLDkhApF+K+rfsBdgJQ6aSWThkY
	 JqpOvSaL0mArNGzN2M0iMSmFbee7mQNnEvqfAqWTLv6U1KEfdTbwejpFRsj+fVtIsb
	 wSB1W7m+2Y7VxZfP8etFbgvKsjrTIkLkEtJ5SYXL4uJdRKyzpjQ/ujP14rk/WfLYuM
	 fBLieuO+kfgLbJeeCbzU2S7ImUhAdGLeQU5oXRt9tS31b98FJutEdKNSmOLoQdXJtR
	 5Yq1GPtrt6yU21YRfIkHj1q/eLrGVHyqMdgbL0cy86aAHatdAKBahoPgjxliq8Dlw2
	 my5ITqYYZj0BQ==
Date: Thu, 16 Apr 2026 15:39:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V13 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <20260416203905.GA29913@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416111422.183860-3-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_133908_399687_0457DB8B 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Apr 16, 2026 at 07:14:12PM +0800, Sherry Sun wrote:
> Introduce generic helper functions to parse Root Port device tree nodes
> and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> Define struct pci_host_port to hold common Root Port properties
> (currently only reset GPIO descriptor) and add
> pci_host_common_parse_ports() to parse Root Port nodes from device tree.

Are the Root Port and the RC the only possible places for 'reset' GPIO
descriptions in DT?  I think PERST# routing is outside the PCIe spec,
so it seems like a system could provide a PERST# GPIO routed to any
Switch Upstream Port or Endpoint (I assume a PERST# connected to a
switch would apply to both the upstream port and the downstream
ports).

