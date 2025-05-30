Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44234C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXu72W2c/dHaudGYlcHs6MkLFzBam6sTjxfym1g2Cqw=; b=4EvvE6o9XxuZQf+1C7Fw5/Mgfj
	ZZaZ5x2CAmDvJwr+ObsLtOoWV4aRfuxpIrvci7COvWdNZcOSLttCVNjCfaEpqaNMM+0blw4fQtyMk
	tGGTEEPtitDSSTNVrW5wZOMRdFt8Qb47SbmiOcclDKTVVnfftYriiTSXaKlpLTAqYJdCxc/b+e9Pd
	olE5Pp6lrJmYqqeCffs5iwTg3Ye8zNA1N3PqBiEMLDNUDv+DBYZ3EafaA9OVRUbKOtSHHl6XEchQE
	mKsHK2m0tHRQfGbWhtmNMVWnwWe6jOEwrkxeOAfqgaRchKUucKiuLIduHY9EoTG4jvrNkg7mec3sj
	mgwZBO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL48W-00000001UFa-2GJg;
	Fri, 30 May 2025 18:07:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL46O-00000001U6f-06xN;
	Fri, 30 May 2025 18:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D93DA5C3BA6;
	Fri, 30 May 2025 18:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA28C4CEE9;
	Fri, 30 May 2025 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748628305;
	bh=tQpBvjWo6fQcYB1zRJnFf6X7KFUMIqebgPWBvhFMjyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmX9XATJYAPtUmZolpbebzc0KHk9SdL+M4W9kGFcTtD12VCQ/gvikG8/VatI5NE9q
	 o5Keb/Aishab28SR3sLWw5khn8V8U+kU2uIBOIOBkwxrj49JmZ/YexpFLKVmk2keeo
	 dYX//hLxHMedFMuXgBD89kePPhteHByakHJnT7LfrYUt+R63j6XHvHpxWLsEhgIROL
	 YWHrbzjgSqvkBoaZgEUussLpEvwB2hubu273inRnshRulvi/+K9/NLVTJfKqWAYlF6
	 rT74e9a/Wvy8t2yWPlrOzS35jtYXcPWglYRjmX28Gpbi61t5A76Ty9F/EUb+J0fMH3
	 1S5yKab1HqdZQ==
Date: Fri, 30 May 2025 19:05:01 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: airoha: Initialize PPE UPDMEM source-mac
 table
Message-ID: <20250530180501.GQ1484967@horms.kernel.org>
References: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
 <20250529-airoha-flowtable-ipv6-fix-v1-1-7c7e53ae0854@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-airoha-flowtable-ipv6-fix-v1-1-7c7e53ae0854@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_110508_110579_B6BE3E79 
X-CRM114-Status: GOOD (  11.97  )
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

On Thu, May 29, 2025 at 05:52:37PM +0200, Lorenzo Bianconi wrote:
> UPDMEM source-mac table is a key-value map used to store devices mac
> addresses according to the port identifier. UPDMEM source mac table is
> used during IPv6 traffic hw acceleration since PPE entries, for space
> constraints, do not contain the full source mac address but just the
> identifier in the UPDMEM source-mac table.

Hi Lorenzo,

I think it would be nice to also mention a bit more clearly what (broken)
behaviour this fixes. Likewise for patch 2/2.

> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

