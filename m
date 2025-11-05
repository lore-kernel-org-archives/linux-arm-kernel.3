Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E8BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 06:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUd6DLvK6o5whodwGYfBeM3f7yjWG7Nk70odZx2g3xw=; b=4H+DQajKj8StQ06s1iG3H2iRj7
	cNVSVzg6to8eCc/TvBnagBpUnlXMA1PDuPLM3RiuZIJOLlLjvq+NY92wm46Y35lteqVW5hbAO9OJq
	uGCwU8p+/jSDsBd4TTAChGMsabQs9kbd6I1hG0nnzGTlhFvUc6x2oK0IOeLIpMEspO/P24QMWA5lC
	TirUGBfdX9PL7LmLgvgsUDSTCnVDTN+dw5gZmhTqhPJQu9+0QTK/ixs/y8pMpjukswVt+kGJItjI0
	JMEfiFrl/AVkALIT1DFqJzTHaEAP1lXwFIu/earq1v8dx+oZNbmzkuhugey658nsBzVuBjQfEPogd
	Sj0BOXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXSg-0000000D6O4-0QW5;
	Wed, 05 Nov 2025 06:57:42 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXSd-0000000D6NN-0X1g;
	Wed, 05 Nov 2025 06:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762325859; x=1793861859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v4I7onznSV0iS0DSJYPSRP7C/cbe6OTlMky7qWff1zo=;
  b=T75MWdqecfcxh8OyhsksSspwQfAz3eEspUXhyX5Lw3XhhBN90mxVo7Sp
   hbki3Vl2548AFE6cPnrpjleCBFjQV8vFKT5HUXxgfBRfuyHSJfK3T8+XN
   Pk98nRWjNkj6FsdebN+tCXadXxUAaSh/8S4aOsqYFBMkvuPjzXO2GzTvb
   FFkPCOU5/AGm1lb6HakG5/rsnE7FZMw2Clo9jeWzYARKeh4y+RsGnaQzk
   fQut1WFg24ZsYegzDKoKd6HuBSt8Hd34nUO/MWmvehVeMFztDCrDmXS6V
   7zsSks/QXnszUBKWhwiDf/kc63Hq/BHDp0CVVaXz9sgAlbsxWp2OMv4u5
   Q==;
X-CSE-ConnectionGUID: /hdDNL6WTrybn1KQmOJVHA==
X-CSE-MsgGUID: /K3jAzfjSq2Zpe6HQBtZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68291262"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="68291262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 22:57:36 -0800
X-CSE-ConnectionGUID: Tg+l6PbhQhy7SIKz+JCD+w==
X-CSE-MsgGUID: YM9Tntn4RNiP17I34dNgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187673223"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 22:57:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 22:57:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 22:57:35 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 22:57:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJJOhzxMSWmLgBSbU/7Xw7NYBK/gWf1RhIPyvK8niMASk+1WkOlWIrO5v5K8HgLztgfIdYoaWeuvwrGhvYOaKdyzSldBvSH6SXw6iArDf/vcG3KgMVtuL7aCADqc+0xWPsA55QY/3lpCfVIyB5FeStogyVE59viUqEeeUdVXtfJmnbUY6mgGZ9vzCammWNiyKCDqKHFlDdU3yCiz/5Z8qqNTce3mW7PqrhdhK4R3gD8CxIl4rDJEIz3LzhxXQxV2RGlguzj6JHnIL89t1CwccILIZaYkycnzBBQuUS1GoZG9FpayVayvCc/xXW3wfn8GkIkcUSqZIMdnumWWl96UZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUd6DLvK6o5whodwGYfBeM3f7yjWG7Nk70odZx2g3xw=;
 b=P1/nOjFQp3sY5eUl1ljREk1WPve7kSRLLZbHC4H30esCwKifz3o6UXK13FhVGxyQI4GZIaybqqtFMk8gEjzDD8KWfKZo9JL+7y4znCTw2kRms2qM8y2XuN5NDQS7JYSl4zEvQokueTD9sA6nRMNtEx7YNELc+YVOGO3Aiz6t7/4kEGbXHry+BrtTMCQ7d40VITUGKyQKx9LQ2b9gLTVQd1nH9L8fL6qfEg0LGMRQLNYoEtZPn47tqWRfeL1Cu+Q0AysaPc1HT5fRSY7pG7P4GN+zvDQi0m/8qbDtr5EAOCGJtqGVW1Rt3lOG7NUJtAvYaMTbqjrGBYcC+oq4KYlUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH3PPFA07D87DA6.namprd11.prod.outlook.com (2603:10b6:518:1::d3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 06:57:32 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 06:57:31 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "suravee.suthikulpanit@amd.com"
	<suravee.suthikulpanit@amd.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "sven@kernel.org"
	<sven@kernel.org>, "j@jannau.net" <j@jannau.net>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "robin.clark@oss.qualcomm.com"
	<robin.clark@oss.qualcomm.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "yong.wu@mediatek.com"
	<yong.wu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "tjeznach@rivosinc.com"
	<tjeznach@rivosinc.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "heiko@sntech.de" <heiko@sntech.de>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>, "mjrosato@linux.ibm.com"
	<mjrosato@linux.ibm.com>, "wens@csie.org" <wens@csie.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Thread-Topic: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Thread-Index: AQHcO9UzG68S0waveEiEek0NizPUfLTadzaAgAC8MYCABjtcAIACWjqw
Date: Wed, 5 Nov 2025 06:57:31 +0000
Message-ID: <BN9PR11MB527638C0E43E8AA000410B878CC5A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aQO//+6/B/WbdK2h@Asurada-Nvidia> <20251103185400.GA1537560@nvidia.com>
In-Reply-To: <20251103185400.GA1537560@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH3PPFA07D87DA6:EE_
x-ms-office365-filtering-correlation-id: cf467d85-3c78-4768-f025-08de1c389781
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?dHBj9VgXQ7bCf9/8Fr+UOfppTCdZUgL+KKbOShNed/HPt+qRIAiFRtutQYYd?=
 =?us-ascii?Q?OLcSyPs9RuvXc+0pRbrnW69VqIG3uPGn0Gb/qAzTz22SxWLbYxx+xsBVc4X4?=
 =?us-ascii?Q?0CT8cpNTDRM3OndVlBBlaVamzrcGs/LUDAW2L0Mx1C//ddfzwxGAcG4fwfPX?=
 =?us-ascii?Q?eXUvCRAyQ4JZwZDyT7SlaesmMSxiH9hCeX6vxuzW8AIHYDq12onHKJR8I3JF?=
 =?us-ascii?Q?FR+qQtGn3QXyk+YIef0GS9lhsJIb4iSnIMDaUR26jm/XfvGIqgme6w0difnc?=
 =?us-ascii?Q?vAHGpON5B9Sfyk7Z8nqOnDMY0OHV5dUzGOakEz88ci6nfc4yhnMGZ0ItcSgI?=
 =?us-ascii?Q?ry2fqX5J7erBdQUTDCCf8aJTu3oFw33EqAECmJAiegNcMCN8XCcQsFLGmRA8?=
 =?us-ascii?Q?+C8qOVPGPeVIdJIeGXbn4i4tqeRrpYFh+PpfR67tpwlhv0IdDF9ulEIumqpQ?=
 =?us-ascii?Q?Y3r9pdWSPNKOUVl7kE4gPod9IfwAhGkDga4h2kIKr5ZojiHuYcVCykSQgJD6?=
 =?us-ascii?Q?hSU3KU86JVSyYEptDyoznDWHRdBLC4jXL1h+y6oQTOR2LTQpoN9h3NKI5tjr?=
 =?us-ascii?Q?qda9R7AZUvazm6DB27SMBdYP8Olwge5xqCDbGi4wMzms+QnlHRgKs2MjG8TQ?=
 =?us-ascii?Q?CvaBR+LnHM8wpZKLYAi1CXGe5TlShCJ70t0jUkTFx5/ZA0ijcAbNDUCyDqQD?=
 =?us-ascii?Q?bUn8AXEg0ts8WnI/99/0L9bNaSNdzPt2Lbwq6xtXmvIRw2lDEOnKoW6hjaos?=
 =?us-ascii?Q?vbhDL6sy+k8wFecJxjsBaXYMyNqLVe6rOPiXs3KZ43ElbM32tsJccp1dWY3l?=
 =?us-ascii?Q?WgyKU2GH9jYOHTqWGbN02W0olKkXUK1tn8PnHIXL5w7sdCoE46HiO4sixdLR?=
 =?us-ascii?Q?YtTYlBN7VqEjcf9AabnxNhPz6HFtfFjN0x9SKL36/nOSqXSHeLAjYAW2rCbZ?=
 =?us-ascii?Q?glONuKn+od/AY3qBTXURJP7I03OATkWHV5JimNBQMRAGfq9bFjvdOB+MW/re?=
 =?us-ascii?Q?b9aI7rNM97ZGlVuPGv7Jh/wieGsKvpzvzM40//XmkOAt2vCqrg4fzpWW/ngX?=
 =?us-ascii?Q?zM86g1d/T5pUWP7RNHgRi/xqlltFbjigfwqAyMelLDaFuaXHRdVLaOoxARBL?=
 =?us-ascii?Q?rrKOVyvdrhrKbbkzZI3nhm7FSfVTdnQGYOjU/7oRK4uut8GiJTOuGcAn4OBA?=
 =?us-ascii?Q?SZo8DD3auoCntrGsCDH5szPIfvfiiTYOQUc1F2/hvNFeq73oSZDyZYs/5SXm?=
 =?us-ascii?Q?r2BW7isaQi7x2XUBU/WC6EyUoDVRt8WMx+/KY0CiLbCh9B/f2a3xL3pOz3AU?=
 =?us-ascii?Q?PoAaA75eL7Eod4FGUeyR+EB+LdPo25+zYlaEpo9er0CdJiYHKBdte8VPe3l5?=
 =?us-ascii?Q?GdWwIQ4KbiuoBxcx3pzUe4hgyX86kygPLe+k9K/MjBBsDnMwcyuIcutqMI/3?=
 =?us-ascii?Q?iu9GMrbKQYvdANtvMqJK4h9eQsl/CEN9lo5G20dUrm7K9g51ro+OLp48VkKo?=
 =?us-ascii?Q?HEeAqb9h07J5OTdv0RXqurlS4VlpOQyPTv5V?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+qvEZfaLjuB0k1xWNyJrzGhQPIjfZrWtBg91uizR2kSxu1QlH1UoWu6n0y29?=
 =?us-ascii?Q?5SSvjn75C9vh3s3u5Y5vSpsqu0B/gCgAmizn9m8KT6+6JhLJs0UGqhmJLVw3?=
 =?us-ascii?Q?+s8KvQuBInIDsVmmWm3o0CMU8b4xOoH6ffcTmLH5teke6dr82jPlBv+Bm9+3?=
 =?us-ascii?Q?mG0NqgPJo7e1QnffhhQXKuwxAoUVE4MtgCdSqfYEG8CzXHnFemylmvJ+2rjo?=
 =?us-ascii?Q?Ih3pFbmGmUvMV5jADlV+XcrlNAg7TAMsB4TObUR8zzX9hsgeXGtodGdViMb0?=
 =?us-ascii?Q?OZF6T+uUZ0Dn9mjxPOpjXRGPo8+3v+UioU5tlXIPO51KaEtkJ6S9TV8ppaNO?=
 =?us-ascii?Q?g13UrmlpzPZTXSJd2Z3cZI2CnKYohg33et2C9QeWpNs2x3BT9eMOETzZABl+?=
 =?us-ascii?Q?93OJuYuoqo/KbRpwdxqAKU0iAJjES5DgKBr6koeq+faiXekNnRvQ5bRVT8hg?=
 =?us-ascii?Q?mG8O0+7sle4eM4SCeQ/4ng0Cqa/I9AQqSv+5CSwhbpvBxLjK2Zx6nJB6liEm?=
 =?us-ascii?Q?v3A1sTnhWnahEo/YEoN0YurLlkSmY6oyZuq8uRR8kvNVM6DAUKXGGWZFFVC0?=
 =?us-ascii?Q?E9i+h04EJZZPR33p+SsTfkuOyZTIXqjPovBT1eo7gmrXZJ6ZDKMXDGudJCBw?=
 =?us-ascii?Q?APM0/YGNiGEpT16K8DRKkMfi8FasLWd+wWSKxxrZ65dNEyZ8nudVcfpVnxPz?=
 =?us-ascii?Q?KihF8zA+iMpctXQ353wBfbxH6637uSTAmw6WjcBfUSZyuMfvAtfhYMd8Y9Sk?=
 =?us-ascii?Q?nGQQK0a9HlYlzCgL0kPlzgf1JA/PWAFGuE8oyN+4uF7ThkytRf1osJAUkkvA?=
 =?us-ascii?Q?a/IR3f6Dg5d1sEEHYiNjnMlSK9CNGHLPkvSTQU4Yz1iE82x4d3Y6jfbi2t6B?=
 =?us-ascii?Q?i75SROn2E6hukxPX5U4xIwtaHmBpKLF8+LLqAVixhiunTTbrbHvCZVHdLcUI?=
 =?us-ascii?Q?q+Q9H0T2hg2WYM67sJ27HSzkfK4fbxbsBeHyCBQ3bdrR1QXe1q7XrSW1DPb4?=
 =?us-ascii?Q?iI5GHU+qBLYPASvVFWi7C8lvAJa0BZz2aJ+TIEGblw3Psa46OjyptmPpIN3w?=
 =?us-ascii?Q?8YV7uTAF09d9mRWDQrqPT/dZJyNjSrj2GesCoXdl6AhMKBuD82cncQjQmYDP?=
 =?us-ascii?Q?ukAP7BztIS+DFDqYyYh6AZ7xXpqERs/1k23vdzoyCVVAEMYr3cXWcnFuFIqN?=
 =?us-ascii?Q?izvrnTBTRYNI6+AlC7ChM/LtbGdb6No/fQ83jzoo4GVYSeq8c4RVkE1AaZfv?=
 =?us-ascii?Q?N55ad/PxZelanK8JJs1gLLxdhjyYGRYzWHwbA2CPnh6h8teL7UHcTcF6ire7?=
 =?us-ascii?Q?2IpENdDGUASloLjxE46R3qvj9x+J+nBdpqLPWcgoODd4fo7ss5PLI343OPuy?=
 =?us-ascii?Q?s3W+NaJa4sqR1JkVsdqkovjwGtJ9vHIufPBFYIruOCWENRrxyEiSJA+w+1CG?=
 =?us-ascii?Q?dBmwXGB/EtV2iwMAboqgwxK8JoswL/2MqfK9IrJ9jRe0qFDSyNS28f77gHcd?=
 =?us-ascii?Q?6LRadxEkIN9nNZp+d7sQyFwx0fAIRjbPEdGjlm7X2+oesezNdSva5UvLDpzl?=
 =?us-ascii?Q?GuhxEltSrjiLtSpvRZ0mKWnwoyHAEwkSPhBb7Mgc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf467d85-3c78-4768-f025-08de1c389781
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 06:57:31.8739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZK2WgbhqNs9CjzRkn0NvKawHDt2Vs7S3d3MvBesKovR9bQ9JK+pWezw5A7o2lCzRa/a0f3MtZaEPGTRJH3l61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA07D87DA6
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_225739_236998_B8F5E569 
X-CRM114-Status: GOOD (  14.00  )
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, November 4, 2025 2:54 AM
>=20
> On Thu, Oct 30, 2025 at 12:43:59PM -0700, Nicolin Chen wrote:
>=20
> > FWIW, I am thinking of another design based on Jason's remarks:
> > https://lore.kernel.org/linux-iommu/aQBopHFub8wyQh5C@Asurada-
> Nvidia/
> >
> > So, instead of core initiating the round trip between the blocking
> > domain and group->domain, it forwards dev_reset_prepare/done to the
> > driver where it does a low-level attachment that wouldn't fail:
> >   For SMMUv3, it's an STE update.
> >   For intel_iommu, it seems to be the context table update?
>=20
> Kevin, how bad do you think the UAPI issue is if we ignore it?
>=20

yeah probably better to leave it. I didn't see a clean way and the
value didn't justify the complexity.

Regarding to PF reset, it's a devastating operation while the vf user
is operating the vf w/o any awareness. there must be certain
coordination in userspace. otherwise nobody can recover the
registers. Comparing to that, solving the domain attach problem
is less important...

