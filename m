Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB14CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 04:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnHX2F5zE3JPk5iPN2wVLd/hvU+t9hNFRxzXStEGyeU=; b=fgeUfRy9rVYS+h03vHzwTXSIO1
	Sxsj473kJ5NtdV7vDTA6bbwPb2vi4iyEyDgiex0uNkETJcp6U76dHkIGn2yYGMpHljxe4b2/wGwDP
	SnRtr/Zl5AtVsUdUCzgCSeQY5kwmg4Fgk72BxlpuWMmHjFSH66rJVhjqFym9d83Wg9YsvQYlITok6
	9h6gCE8jEnCOWx00NplcrMB/qWZUbqs/qf1vuvJ3gzJpLmYVMDzNlvwhOHigJAlSM89vw318YdcUO
	2QUdhEQrb2Iac4YCbZcke9/6AbWiMyQ8zzuuknfoINf34qIXbhSYCdKVWD2Kkic1jXXo3iFa3LzAo
	2/KnKcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrL3-0000000FQyO-0JTB;
	Mon, 17 Nov 2025 04:59:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrL0-0000000FQxW-0loR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 04:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763355578; x=1794891578;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PnHX2F5zE3JPk5iPN2wVLd/hvU+t9hNFRxzXStEGyeU=;
  b=aRVbEbV8oOxyTDx0iZXs+56clHuzo8PafOu9iPaERIOvbVIIpmURSKbU
   K/hb8NySake1yrz2YKMKNVDIUiV0Ravy8gRuuwIka052dyfDOt1NPQz7g
   CVkynLd5ojc/06tg0t2mECk0gSGL3GIhiU+G8+2SkjTver1TunTTmk4V2
   dAskecq3SKObZdWRqgX1O/nMfazvlZjhinftnTg+rZSuFLTXahJxrTl7T
   1pRdO3T3mFJrDZFnFIi+KOQMu3jrWh2qOhG5uae0pY9USJpCgQhPU9xK3
   5BL1vR6QLQCJ/5W5LxiCQnN3QNaKMvkRhz9Yr/JAjdx9LSbPuE+xVsmUw
   w==;
X-CSE-ConnectionGUID: pLf7RYAbQUa+Q+zCia8S4Q==
X-CSE-MsgGUID: WSGezN4lQgCK1ynV1aZOZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="75950518"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="75950518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 20:59:36 -0800
X-CSE-ConnectionGUID: JRuetD6lRWitFqq+DXV/fA==
X-CSE-MsgGUID: CURfatHlRxedYMZM798o0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="190588700"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 20:59:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 20:59:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 20:59:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 20:59:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vf4mWjdkVd0fz3GPKz6mcwy9tazQZNlsABY3kTxiOcI8yFU17N6PN33bXnl9EdqzYJbnJPB63mZLDlxh3HJZthIzPeydgAgoKolICFfaF1p/4eQlbvmyzW6icd8bVPaoLzde1zE+BvXVlEHjQ2PEqiNKIN3sOe0DSEIjiTmJ2B7lhNV4OSqbTGFzCNb0SN1jm/6FJQgq2LjEQMJY+bNm2pd+s1FIqvHUK3doYOeuUOYlF5TdKG3O20mwPh7u6+fQCb6o5icMockAsCaKGyc6CiAIhc9RuckV9q033pN9DF3n/cf20qqH/o6WFvr3a9irRg+b7ycOiBUVMrBzfMUvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnHX2F5zE3JPk5iPN2wVLd/hvU+t9hNFRxzXStEGyeU=;
 b=dxJFeVvSw+ztHSJfLVraNOKwcTWF3IkvAxsk1ndA1YiOlc/ZeREXQH6tCD6+sdw7FIrqX1XY/P0aPDpQ12KBBEQl4iw8vWJiASdh99nFCnq+EXQ4D7mKYdhNLBl/jbAYSRU1RTJe98BTco1zzQULG21a8luggllDXbcgM+gU4v0zl6At7hAKdayTCel9u1lvo/vmN6UH9K2GuNG6/fMuPuAX3YBJfvBbc+Im2OWBKcHFNTF4u0S4veXyfrGthvXTlQY3gvqtCz8VfqK1lJzccIxrAkhq2AZDt2199P0S6vzXW9zdHw1Q4kg8GZ1N5UC/xivcfU2oD/o1+ZqA+qjJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM3PPFF3DEC9799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 04:59:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 04:59:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"afael@kernel.org" <afael@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "alex@shazbot.org" <alex@shazbot.org>,
	"jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, "Jaroszynski, Piotr"
	<pjaroszynski@nvidia.com>, "Sethi, Vikram" <vsethi@nvidia.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "etzhao1900@gmail.com"
	<etzhao1900@gmail.com>
Subject: RE: [PATCH v5 4/5] iommu: Introduce iommu_dev_reset_prepare() and
 iommu_dev_reset_done()
Thread-Topic: [PATCH v5 4/5] iommu: Introduce iommu_dev_reset_prepare() and
 iommu_dev_reset_done()
Thread-Index: AQHcUsn0U4OK+eFVREizq+Vz85UbGLT2VkQw
Date: Mon, 17 Nov 2025 04:59:33 +0000
Message-ID: <BN9PR11MB527668CC33F2356E689AF8F38CC9A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <28af027371a981a2b4154633e12cdb1e5a11da4a.1762835355.git.nicolinc@nvidia.com>
In-Reply-To: <28af027371a981a2b4154633e12cdb1e5a11da4a.1762835355.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM3PPFF3DEC9799:EE_
x-ms-office365-filtering-correlation-id: 54bfdd06-2196-4ca5-a843-08de259619af
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?5T8HRTNRnm08xD7qn7t8b5WpWBv6nPR9iT0TJJS0Aqt4AXZ+wiffBpmZ6jWF?=
 =?us-ascii?Q?+phdPQj9REq0e94LvsIgoj91VB7hx2q9Rc7ooHpkTmhGRZJih4XYb8uLzh4O?=
 =?us-ascii?Q?hdo1hbvxeExxsGNKV6vuMlwpoiEMVkZWL59Ynv0CeY3G82cPo6ER2o5zh1KN?=
 =?us-ascii?Q?WSOk7cgL5undk2cEIA+z4N2SoQIBVMcPSNj0oXHzClViTgNh45vrF4W5bGis?=
 =?us-ascii?Q?vWUwtCV9tHR0CHU58z11nD9wfNQDjaWEwM4hFtjX7XuIfh+LNutdRjgW/3Ym?=
 =?us-ascii?Q?wVzjQU9DTN8vexe1u9q9faKP146kzaawcXnG9+jKJUqKLFtNf9vbbXsOB1L+?=
 =?us-ascii?Q?W77M+kYOLLNov28Q3z9u7ADp1RkMEvkWcg3XzSNrp0MRYPrlPHKNDY/oV1Oh?=
 =?us-ascii?Q?01+8o97zwaXU2EQKZXXzR9BfOKUyI+aT0WaKJfwE8gjpZDMVV0ZEUD/VUQBM?=
 =?us-ascii?Q?HIyhIcUYH6Xf85CTjAFUmBfD4ctvmt2TuhAtz+HIQ5dV3uetNjG2C45gz/kG?=
 =?us-ascii?Q?WLrbVcIPxZ6EHuvgrQtvE/fAfZO6EfRGxH6uqZsdYC9s9lcMRuVlLR3nwpzS?=
 =?us-ascii?Q?UftY5BTJILQQNKnKDQ5QxuIYcQUO32eBAgB/1EWp1YxrZf9oHBPRy0/8kJtf?=
 =?us-ascii?Q?OTWSdZo+l7tfHXyyNNF54UjMvvYoK3vwunNwCqRH6agYvBICFmLb+dS9Gwep?=
 =?us-ascii?Q?GDbPK/2d0cd8Zg2ijQ8tG34ZcyRn7gbAzq8X2/tQdNaQIWAC/EAA9pU2MLL+?=
 =?us-ascii?Q?kIzpklMjkoCd5mqp3b+j9QW1XtMDxLUm7Si1wI4UCUsC4sjQwAHsLnwvNR51?=
 =?us-ascii?Q?S0lpi14XbslnnTlZjagouesBJ9NPG0e/YR2rYtVkF58+XfgceJwVqPdLRqlE?=
 =?us-ascii?Q?NvQct/gTe2tPd4ox1YomrVW41Aw6XeY4mNsmMdQLIFQ9Z9mMM2skTOmzX7Oh?=
 =?us-ascii?Q?V0azdcebs8LUg2IwaJEIglrE33hakIYPjnWQxvRiCHThsnhSkmrCCeh/5Hu2?=
 =?us-ascii?Q?Ed0NoBx/6/ItXz1ADVyIhIyH7WIumesM4HShCIjB/IC4HWji2o5XX8EEdFeH?=
 =?us-ascii?Q?ZmYg3421UVmQ2jiE5ycfY+BrgQe5DeBLdWYLJmQhflHObAdH96FqpraRiAVP?=
 =?us-ascii?Q?xdSuJVVRgIMagsZ+QorBsMGb7YHzbBqAXgqTb/5yGCcttTdBgN3WGDpfUQKF?=
 =?us-ascii?Q?2E5TnCX/TbsRagqK2XXzqYSMyAWIPN1GmQhlyhATxrFQDj05iwYPIDTlnDqs?=
 =?us-ascii?Q?5u+s/8SHFVBSN+ASLtxrzjk4HZM3kqDS87clyBv/ldYHD2np2vuaYQ9eCvYt?=
 =?us-ascii?Q?/vjq+iMqoahL39B+CpsHdZoDOb2CVYCJyXeCVCxW2Najq5twUoddGfL3n6Zt?=
 =?us-ascii?Q?wmVg0+2n2x9R4k5LlZLS6PqHNe6WMzOqmZPh5R4id5ZKro0gOL6ItUQIc785?=
 =?us-ascii?Q?AjblnkYPXD1kbrTrO9Cd8LqQQ+doPVhahJEDDqAfR08Qu2piLuYCxLJir7QQ?=
 =?us-ascii?Q?SKP/cr1niyz6O9/6OuRrJMES9Pvk/zlsAz7M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WsT/D+mXSCPbE3+ZMBMjvBzkIevOsq++btxjBI6/E/7SWngBrJ/TrKfB1Uub?=
 =?us-ascii?Q?SxJdf3aSTGCUr1jDFNyYOGFBlBFglXYwpd4cqIoSZisZqib5vmfyZxbhEK46?=
 =?us-ascii?Q?nQVodbWqtJqwE25SgBGr6Sg/6nqe349U7QtaRpq1tVsL2KzJxDE7yQIDK4b/?=
 =?us-ascii?Q?b/i5k/T0iO+LNm3w2dRK/DHFkI7gWa89NniqdwmTfgrXrhudXVSiboLDop39?=
 =?us-ascii?Q?RNnOfOvuYo/NVdyywlRTuRzwVE1zZoe1sVMey50U+vPsrPBG92saxKLpgccl?=
 =?us-ascii?Q?mYnhQgmx/u70bPwutd8GIIPMvVaBrvdD4ePgayz5smk4EzJLPIIm45TFQto/?=
 =?us-ascii?Q?rMEC/oPk5nFC6VU8QVaj1vN0BAN2xVbw7l7viP8TO6IHsMB33xRSkyO8tCUu?=
 =?us-ascii?Q?V2ES+7YxW48AFKM94AwTbspSc6IAavwwA7by3REC8CowAbqYJZgW/Q41n09Y?=
 =?us-ascii?Q?JbNGhKvM/c78fmgrMzxf1kJNy/pW5N6R+vFRZbiq0Ur7ZGRFQ4yNe2JqLl21?=
 =?us-ascii?Q?kwx9J6NkTsnzoEPnZX5t53++o3xTA5NlLKUQUAO2Lux+dzqEn/EKqVzSL0MF?=
 =?us-ascii?Q?mReg2G79Jnb+Fch977xo9BmUWE2pBDbSXpk1ZoAeKvfroSDh0ig2U9MQy6F2?=
 =?us-ascii?Q?fRn0RMRHdcAhJfhVTp6CHBZavFWZ4eQDmWiDCmhKwmtUgmafn0k4QspfKHDQ?=
 =?us-ascii?Q?5SF3l78wv9+2+b/P+QB8WMTWArZ1AhWBfkaCDAfiOvPZ9vaqvfpB9P9mknqm?=
 =?us-ascii?Q?dOAsUk+Pb5JP9QG8kyRRGsonUeQeJY4cBYg46zhD8YEtKHPDOZflaWcyaBXf?=
 =?us-ascii?Q?YFHURbztAo5y+M6cfG8Y8SGTwk80rojdf9lD1TatojTB3L0a/SNIxakUXXoD?=
 =?us-ascii?Q?AMjszmxh1zNLqOVZLCURQEW2lzFUxbw3iJlu4FmvrHfVRAxM2c2lzMNgBp0U?=
 =?us-ascii?Q?+b1qEqSFLXjN0Eac9G5C9jBUi7m3VvBRHzbD8F4cJQQYupXOMqZ+WWafDBZS?=
 =?us-ascii?Q?fC0n4uGbK3oPOlXo/Sn2HuIsRMLcZ70foN4llVrkSspBHgZusaONFcMxqphb?=
 =?us-ascii?Q?enpGB1tSWNzaUaXSb6Qw/Fy5NP7VAluL3+y+Vo4YoBxOQia6komlTaYuuCyH?=
 =?us-ascii?Q?S3Fg8jGr6O46ritFeuFTm0a16R7a8IJari4E71SGNCjTs80pVtuBUngDa6ji?=
 =?us-ascii?Q?WyGWjs3BQEDtVOGxIYHjKLTuJnpF37arxa3eSxiOft6GCqfBSnZKQKy1ZYRD?=
 =?us-ascii?Q?BE3nSXrwoMPt9XW/MSc5NdAp+dSTxKspZ/8CSdPCb67wWJqXtPJgJigOrVnt?=
 =?us-ascii?Q?A2/MQJ3sVF3Vv0wD8TY3+97QOfNdzFX46M2bA5cy6sv7d+yXJmM60mSx+dRS?=
 =?us-ascii?Q?qKlh21+kebg/sBClzb2l+iVONgOVpPgjFYdJMbCIxQ5zaExERuLR5qnZF0gb?=
 =?us-ascii?Q?uwk5XvAqJkMeN9xzadjbTQC/cIF8OyRBaJHVQsPHkKjASr/+J62YEJ1w2m0a?=
 =?us-ascii?Q?VFmhRuqMWqF8YfyROG6LcyhFIWWgYHIZNYMnJxEeTTm1VSGlb+Dl9a5BXWdE?=
 =?us-ascii?Q?KeJNCGdBlmd+LXszSnCD7Oc4a1oY6gA4Jd7OmXVK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bfdd06-2196-4ca5-a843-08de259619af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 04:59:33.9205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h50ZiPmP9uSibV4On4O1CfEP5N3FCDoG6WZREd8HdUgifnT2tMxlU2aYK+Lh8BKA+a6z0sQe1r7Vm7dZdC8qvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF3DEC9799
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_205938_242573_F74F01A9 
X-CRM114-Status: UNSURE (   8.72  )
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Tuesday, November 11, 2025 1:13 PM
>=20
> + *
> + * This function attaches all RID/PASID of the device's to
> IOMMU_DOMAIN_BLOCKED
> + * allowing any blocked-domain-supporting IOMMU driver to pause
> translation and

__iommu_group_alloc_blocking_domain() will allocate a paging
domain if a driver doesn't support blocked_domain itself. So in the
end this applies to all IOMMU drivers.

I saw several other places mention IOMMU_DOMAIN_BLOCKED in this
series. Not very accurate.

