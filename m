Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF21C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtT0ExTXo5bL6h0YkCoaVWGGXnkWOHvTo5L6MU1yaIQ=; b=23hcaYf/F1V1vFNhYZalEC7gYr
	KU9p7AtQlVYmzgw7ELKoybWALJ34ITHudefmttuic0RvBeyRIagPmgBYMdXEF1lncfDtFyUbtRr2/
	0r6C/MSoafC/PD6NONcWObylHJT1uy4o1DmcdR4C7i2A1QcnqUTOqQj9HgjfMeGhT1lMIozZs0A/T
	BlTksORtl7aBK4BOQGb+vZr/1DO2t63YvcWequbviDwZDl8VpshDOipwsmAVa1N9/4PUykO+kJaVc
	8Wql6mUffph8j1G3dJoWlB84tP6UJPdcWtGtl40j1sv6L4e0J+B0+U6X3WDmLZsC68UTbS8MUMoQa
	xcd7WTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7eU-00000008dSy-0o3E;
	Wed, 29 Jul 2026 17:01:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7eR-00000008dSO-3gk6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:01:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cab97c86bdso515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785344463; x=1785949263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtT0ExTXo5bL6h0YkCoaVWGGXnkWOHvTo5L6MU1yaIQ=;
        b=C4VsTtdRtTGs0DhnvtflmsMVzYgKpPhMusnd0IN3N5/KQA90GjvrUPkTTL/rUmjUkL
         eOfv3U9urFBAKqwY3WeZdtjjs5Pbb54DUtIrDAkcigyr5i9kZsJE9qaV+xif3GZLRcpG
         BKoWUIzMfgx0rS9rrmr3KhkER87GHAUFmlwZr0PkZBpd9un5hLSQJzM4dL7m2utJf30i
         v11TpV4g8FE1/WdRtwtNT4KN6JB4yTVxOZQlwsGLqjF39theVEwx5vfl8wm1jXKCsMwp
         CgWHEm4AKpmwJBG25OF/XXrBPj1vXURr0ZLtaV4WDGCLg6TYwvNPS/0bIw6+ClImu4NE
         16XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344463; x=1785949263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtT0ExTXo5bL6h0YkCoaVWGGXnkWOHvTo5L6MU1yaIQ=;
        b=WoS9McTkVmsh8m7yCdEDtjGHKF8YfRtzpMPoXYGhccNS/YqngnhuOA+qbL+H8adaL+
         gEK5r7L2LgZKBMCt7xR0M1Jk9Lgd/wcoGxglbhcHAcyT6IuzFWbqhqComKxgymwgEbpB
         qf7o66BG1Hy/5h33plEXhsBqYmOdbyDuA2gIbW7z2pc3xm2/rHLlpjiedXNP0DO9IRmy
         mTC+tWNMQAMiW9OKabSUdE0ihlt6RJiqhliyJXlk3DVylfZ/V/aBB1tC9HCEW6cYNeen
         YyhTaeK1X20NQDZREbjEC9tuaAaZHqxhBam+cBbZBEU1Cf/CMnuWVVYDJ+BCCNrDmtMu
         IPag==
X-Forwarded-Encrypted: i=1; AHgh+Rp4EgeAZpQaQ79hE5UjaemTyR5B/6lvNXIlv/iSsetDH50X+tOnXrVi73bAaABZpf03WIj4yAPvaltXmzcBYp/b@lists.infradead.org
X-Gm-Message-State: AOJu0YyPmpIdQulvv7D+phUA4Rp8qeF6kv9OcjUXTFngqX5Ndnwnxhoe
	G7leNTnrJQzBSZwaujx2ZQy0bFZOxtaqXY9pkvvHr9LogKzi40wLhfh84OLl6ooBgQ==
X-Gm-Gg: AR+sD12mRCXerS/rwietGR1hLQnY8WRVmPAqcaP0qwnp7K9RGFhQnpK/50zwRwmTJGF
	TpqYDQYnkq731kles5u74Uk8uC2wApTL1xxCTtQUcQMQw/lMUQesRbfyVq0r0lyH8ulXoQ4o2sB
	eFDZrf3dMk1eYEo1CKxOAYW7oSdd3wNsca1x6ctNHDd0VAr+3Ie3LzQIk3JbE4mXQZY/L7jZnYG
	e9cpHw5ikcZ2T8S4MfON6FE7x2SRgDdtdkjO+9NlkWHZjtl+usme7DBYI2hh1KZ4tG1J4UDfzO9
	O1Y8MSkNy+5JRq59vHY+Hnt94JRQtJ7xBKxsX2EEquItQyjbV2HFLjSlIn0nQBdMm+YuC5aA6EH
	xXftygHFbVUzS9O54bSEy1WxfEbuiP5u2PiCFpmVfZDbhSPtjkpV4vXI9THYGtgDTJ14Q4twDM2
	5MErIr6P8D/Lij0jInLni0u6abWTTvBMYKNG6QcFpki8iXuzgGpUHbtBZUe5rx/MiIRDwxR8jNs
	TXLr2HQNdCD8a2hHyElqkY=
X-Received: by 2002:a17:902:f608:b0:2c0:defb:557e with SMTP id d9443c01a7336-2d03210f8c4mr355465ad.1.1785344461607;
        Wed, 29 Jul 2026 10:01:01 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0051591sm1750258b3a.19.2026.07.29.10.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:01:01 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:00:48 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	bhelgaas@google.com, kevin.tian@intel.com, kees@kernel.org,
	smostafa@google.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
	bbiber@nvidia.com
Subject: Re: [PATCH v2 03/11] iommu/arm-smmu-v3: Add
 arm_smmu_drain_queue_for_iopf() helper
Message-ID: <amoxwA6EPeW1uuIp@google.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
 <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
 <amkcQRVylEe_t-yP@google.com>
 <amkqZbPJs9qly4pH@nvidia.com>
 <ammMf5z-Gl-Wygk6@google.com>
 <ammO+4W/dGC8kTCr@nvidia.com>
 <ammTr2kvjpiOHkbT@google.com>
 <amousSY6qMX3felk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amousSY6qMX3felk@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_100103_928273_902021BC 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, Jul 29, 2026 at 09:47:45AM -0700, Nicolin Chen wrote:
> On Wed, Jul 29, 2026 at 05:46:23AM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 28, 2026 at 10:26:19PM -0700, Nicolin Chen wrote:
> > > On Wed, Jul 29, 2026 at 05:15:43AM +0000, Pranjal Shrivastava wrote:
> > > > For PRIQ/EVTQ, my only worry was the HW producing more events,
> > > > say Device A is detached (we call drain from attach_release) but Device B
> > > > (still attached) starts an agressive DMA with multiple PRI requests/evts.
> > > > 
> > > > Maybe we should go back to snapshot based polling for that?
> > > 
> > > If you look closely, "pending" is the snapshot, regardless of the
> > > growing prod.
> > > 
> > >  * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
> > >  * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
> > >  *
> > >  *   cons0                cons                 prod0         (prod)
> > >  *     |<---- drained ---->|                     |             |
> > >  *  ---+###################+=====================+=============+--->
> > >  *     |<--------------- pending --------------->|
> > > 
> > 
> > Right, but we write back cons to cons_reg only after we see queue_empty()
> > We have a do { .. } while (!queue_empty(llq)); and then we call
> > queue_sync_cons_ovf(q). Same  for PRIQ handler.
> > 
> > IIUC the helper relies on cons_reg being updated:
> > 
> > cons = readl_relaxed(q->cons_reg);
> > drained += Q_POS(&q->llq, cons - prev);
> > 
> > Thus, if we get a storm of pri reqs / evts, we may never leave that loop
> > and queue_sync_cons_ovf(q).
> 
> cons_reg is updated by queue_remove_raw() every iteration inside
> that loop.
> 
> queue_sync_cons_ovf() doesn't update cons_reg unless an overflow.
> 

Ahh right, I was too focused on the storm *facepalm*. In that case the
new helper LGTM.

Thanks,
Praan

