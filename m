Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2003AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9sWzu+jrS22KszzGNUWN4FVKlBBxMMSviFUk9d7m+8=; b=HqKZQSWMNeo2EhPzriPiL+T+V+
	d/szowxsllR7as7qkWEmo6paH+Nm/dWFVPuTCZila851UhesanXVs3BG/UTcLbupD5xX8paCbJds+
	t/h5ptjr6LF04KGea8BV1MBurzbXu0l6EBVrDwlSYDbAKIb6IPcbTP3FCTQRCA+Xpr9vBAzPgVNwE
	AePMIdw9PYSpKQZJtUJ4Z0jZNAN1piSxjm5DNtn5iqFSg2NbWvH3XeJwLwGp6ip7VMFJzCpvRLwdh
	wKNtpWY8XJr7OFYioTMXwn5CSYAE/zFqxgUjeCJbviz7LQ0ZlKacXBfXR5DR9wFG+cE1ziQYaER9V
	wSTiyq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAGC-00000002S2y-1Yv3;
	Wed, 26 Feb 2025 05:47:08 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAEf-00000002Rwf-2n62
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 05:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740548733; x=1772084733;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=++6djOQAEe1B+vd/9KrPcvRzuDgVELNpD0pj9UUy6NY=;
  b=UKhbwRF9Y4IBIpye8K2mGBJ5VNG3ud9CknmnmnQQwe1K6upDFVSBGU2T
   L2Vvtb7NByDUi5tutDuffcWXmREVgzVcNP9gnZGMwkVZiencGFodo72ym
   ZPGIy7miGZsBhCzS87zrha/FDHQM1Wc9iHyzvO4Il+D++ufWJ/bwEoTAz
   o8qoHcE5v+S2tLF5q9aXLva1QNRZ99Ll01rwJA0uCNS7rGUIe9v/+4a+U
   XMv5oW4FCkiQ1FgPfWNw+hbaEnR5Dbq2OFHQAhMv7aLn+TosS2aN6vClt
   28cljulZ2eCpTDGozOdqxNgtJ1lVQViETbXYcF1vyEYK3JGVKBIKHuxQY
   A==;
X-CSE-ConnectionGUID: LE1u3oQPSoaNTQxOtoDEEw==
X-CSE-MsgGUID: XSsMgi33TQ62IRhV9mW9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45295782"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45295782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 21:45:28 -0800
X-CSE-ConnectionGUID: 8Y9jzLmYR7alrBOq2PtsJQ==
X-CSE-MsgGUID: ZeGz/YAkQ9CzhM7IwOb3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="147428792"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 21:45:22 -0800
Message-ID: <e6922f47-a804-491f-a3c1-1fd93b7b4edd@linux.intel.com>
Date: Wed, 26 Feb 2025 13:42:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] iommufd/fault: Move two fault functions out of
 the header
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, eric.auger@redhat.com, jean-philippe@linaro.org,
 mdf@kernel.org, mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 praan@google.com, patches@lists.linux.dev
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <14a01d676b06dc7c013edba6961a4c1e9503a4e1.1740504232.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14a01d676b06dc7c013edba6961a4c1e9503a4e1.1740504232.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_214533_715444_17FA6B71 
X-CRM114-Status: UNSURE (   6.91  )
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

On 2/26/25 01:25, Nicolin Chen wrote:
> There is no need to keep them in the header. The vEVENTQ version of these
> two functions will turn out to be a different implementation and will not
> share with this fault version. Thus, move them out of the header.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

