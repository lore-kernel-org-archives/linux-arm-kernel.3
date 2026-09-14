Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED726C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAHp48baWR5R1QOKt1jjC4cltuY1LKBmTsnd+LBiivM=; b=HSuaVDuKTuaez++rpT/ulJJBDA
	6a4S9MnPKPZIINXMl768JQuYf2tN0SyuOZWTR0pjSdhmXlIs/hXij5vtWCxCdoL+oeSx0sp9BXGRm
	sTtoe6g9qGkvIkC1hdMs1UR98ytO/rHWPu7AlUhiPZPxjKegAue6nJZ4HoM7cljPDl+EZzSXbJd/I
	BFLueg58Gl4PFYLZJ68uTgcOvlXUhAOJnMrlmMNWXmcgFv2o50uOjPjWGE/S6aJrJ3uiaRmfDsWXt
	irl6YiiTCBz1j0tWGTUjlRG0iNLz0pzLewkRu/4/UDbVYk8tO2hGovIs5ML3gYdibsENI+9FlBbWn
	B00hVYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vmv-00000002A02-0hBz;
	Mon, 14 Sep 2026 01:47:17 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vms-000000029zb-37Ul;
	Mon, 14 Sep 2026 01:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789350435; x=1820886435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xAHp48baWR5R1QOKt1jjC4cltuY1LKBmTsnd+LBiivM=;
  b=PZ58V6b5L4HDlfSwK2AH0/alu5D7cUk3q/qW0ZYr0/k1FAHknzypNS8r
   w3E96ZpjBLqD0x18r+Oj2QQz0DH/YmgRYaMr2KRYC5QO8J7a9ETeN6jXX
   7LDhTKnGqoBD/2rp/jY91c/+5Fe1buX1W/emvDgIZqRridivHZmFEGeD1
   0HqF769vb0hJ0ZXW2uGYZ5JjgLXVVht2u285qrNjpgUoI84N0I+Dm0QVI
   InQZoi3NUdNn/sbzpldWtRuXShDtqebQdRc/i++4TCJ8NjOf28vIpZqyU
   KWW1XSE4C+JC4upGewFY5oVIEdGBoUDCMAtIVrzxxC5KDJ1Kushyfm3wN
   A==;
X-CSE-ConnectionGUID: ObCtT5eoSmyLO0Kc9yUvPA==
X-CSE-MsgGUID: uHo/73lgQhK6lHfvOxBRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100034280"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100034280"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 18:47:11 -0700
X-CSE-ConnectionGUID: SAuVXkO7S0iffVrMqkiS6Q==
X-CSE-MsgGUID: 7HdWhPrXTDef5ckQBTqegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="913231"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 18:47:06 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit
Date: Mon, 14 Sep 2026 09:46:57 +0800
Message-ID: <20260914014657.633599-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
References: <acb947435fc78d5c06039c7bd5609c735468b0ee.1789002236.git.junjie.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_184714_856582_4630F5D3 
X-CRM114-Status: UNSURE (   5.36  )
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

On Thu, 10 Sep 2026 09:23:00 +0800, Junjie Cao wrote:
> No MT7922 here; the Zenbook reporter has offered to test.

Tested on the Zenbook 14 UM3406HA, 7.2.4 plus this patch: channel
42 tmac 3 -> 27 on OFDM/HT/VHT/HE, iw 0.00 -> 14.00 dBm, matching
MD11 = 0x1b in its MTDS.
https://bugzilla.redhat.com/show_bug.cgi?id=2515420#c20

Tested-by: Fabien LAGARDE <fabienlagarde16@gmail.com>

