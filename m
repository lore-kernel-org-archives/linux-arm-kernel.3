Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C4BCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSIqwCOmKvuJgP+W+1Ip5bdDln++co+nhjJC4ATyz34=; b=XZA74WVwkA6L2mJEYyNX7iFU4C
	va3gzxtS8x6+rmSZPylPqvmahuzxFf1ZBi+CdsnRlR5GHl5KdVhgqw3HE5KZQwJIQ0V9fgoz9+g+2
	KsqybpweY5w3eT8Ul7jZYyX0IpITv7DqGb/HtOkHfuvmPXSTRMrwknkBFEM0NHo+YTi5T6NzMYwK1
	7sTpjR7gt+DicS9CmV1tiE7R6fmfX5aoc89mOF1byoPhr0kYaWxGm4BsTAbaykwIma3S7UroybV7O
	/bJUofjBHxS0dzuipMX3rK6zP6xsK70FL8mPeizpdgatP87h/Z7KePJrpl7VbmMDydWTOanLGqOKG
	7XbwWMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRCj-00000008ACh-18gA;
	Wed, 24 Jun 2026 17:16:01 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRCe-00000008ABq-49SU;
	Wed, 24 Jun 2026 17:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSCxeYUA96U4R39kFzqtydq8kM3rWx1GYLOV8nSWSWmlfHuf2uuNiYPp9MFwUUmhAJBrZIzVR3rkhfMzIG2y5zhAyU6D+vSTHWznnwWjb4+on8Cngieoxp0Ksll5jzArWS528bwf1B8Rsi3U3EbLBPduOsTDiwYu7k+yz7S9VhDBgH0g2WGPRFpep23sW4pDl8gu1xbWx7zcRYz5adbE4rUUixqCS8roWftwwZQZ59s9j/tkhrgikhQ+ZecW8/cPbQI66VcYr6P0qmOxtP8mRBtuilfhxxenYmIgnp74YDWK4AtarO/pvG5YYi92oh1fnulrqJ3yarpSIQJjpBNIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSIqwCOmKvuJgP+W+1Ip5bdDln++co+nhjJC4ATyz34=;
 b=Zx2Byzik0swi8PbBrG3JwQIK1TLcdiAUCFWlJdJ/UaZ7eGSPhmDR3n/GQT5pxDZYirUWPqe4eZm9ggQqlYGNj0N73wp2D7VuyoGYwTGNQ6M7xpQo7ORwrTqrfvwOcsjeqHiAzHMRuGMCps/K/Zbi0cfNiN6bnLba4mqy/6W9rfgBMzikmfOMPGwarV+SWU5zPlw6U5pujioJY4/8FiRkJeKqbZYSu0xzAo//2YAQ68/k95LZpRe39L6aGEoifJOUc8pvPCRgNt2M8C2GFDeeXunCdVMlpC10gfiNymFr9N0C/pdyGhpY1GkbJD8/KN/qg9G7vjhHalQhOqYkDwqbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSIqwCOmKvuJgP+W+1Ip5bdDln++co+nhjJC4ATyz34=;
 b=kWG68TTmKrmfX8gm87FD60+Zreg8p8oy5zLpd+O9fDrst3ycM2Ct918Au47ZIPkgnE/i/JLMve40LI87d+vyR2nCiOMEZ4POppwxOn3w8pF4zljyuLmFB3SGs6k0W9sP7LVmFzRYwo2ZHwcxlHNNIyyXd0YF5Qf+0yxXM/QhNZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 17:15:49 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 17:15:49 +0000
Message-ID: <cbe3b560-bd25-441e-ba52-32c917880102@amd.com>
Date: Wed, 24 Jun 2026 13:15:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 01/28] drm/amd/display: Remove unnecessary
 SIGNAL_TYPE_HDMI_TYPE_A check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
 <20260609-color-format-v17-1-35739b5782cc@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260609-color-format-v17-1-35739b5782cc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::23) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 5755d2fd-7d55-4b6c-b7c1-08ded2143c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|3023799007|4143699003|56012099006|22082099003|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: dtqJ4pYnfN3v7nM+BblRoj8FVRKvrfwNCemZena2/F6nC+M4aBiGWgXA86SfCGt0iRVdl2oIGzyUTqL4CeEvpiltIHl4LO/vMi3bC/rP+HXuCfry5AdA+SMR+kWuYnwY4nPFtikxypSRSS9vQetslua4wL9uXK00aH0qeiISB1QtjktY+1mUSdwFmt9UIxN5s0xuqivs8RiCh4UjOC457X3N7EL0JPTElryvG08pxNW9XtmeKoqsOGq8+vtkHyPu1EslVr9YBYejrh1NPTk8ZA72cFyBSrzldMK7NhfV0Bmpl7cmpEL+lFVAZKUJoJvByMnZ0tn5M4ywZ0o2AuLUvSv4hBMEGlr/tVJul3VbqUnYtoeKGh+TE9WeEv6y62SKBZDkTXjvxgHPEXrsTni3bcai2KhO3jsXwyP3OxzDBODIPutkFiWxiHkyFAUl3POBDOmNOnm/n7mQXEIo1Lac+6v1LDXVSa4l3lL3wtEUSIn3yiG28TiibD8y5lok2z5zXu9Nu7N7iKja+4oZM0IGzDFBaeF+OJHCDy+NfxmPCZ4Mn2KKsAXlbjLoQXj4alWtrD+a1H3EEzTokH2Dm8j46VNyHgLTeicd6icbCtCH/bSqNti16tVqwAYyycWiYwf8J6J8bgsaKO2Herygp5+eDF5szRu5w5xToRZ52e8uhh+LO+/phd2g8w9UMmMWYU2K0nHEgTytHreRbdF9v8sXvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7007.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(3023799007)(4143699003)(56012099006)(22082099003)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNVNFQwZk9pY2RWcnVhQ0gvZ2RockRJdzEzdEI1MUF5RW1EblhMY1JyTFFl?=
 =?utf-8?B?V0tBdlJVWDRTeU5OZGxKSkVGTjVvVzYvRzhhVVRXd3NTZEl2RVI4b2d0djQx?=
 =?utf-8?B?MkNBaHZlaHFCNUNzTnJDNXp4aXhhL0Q5MFl3UGZGTGZwdnNpZnUyeCtNdUdI?=
 =?utf-8?B?ZUl3V1VKQnEzRzFPVnU5SUhtNDJ5T1R0NDdMMHg1d0NHc3F1OU9QczJiT0I1?=
 =?utf-8?B?OUxMS01wZWNleXNMQm93Z1RkRHVjalgzRjFzc3Zrd0xVc21BQW9BaGpqeis0?=
 =?utf-8?B?ODRZa0VHeHVvQTRNZUZINHRnTVg3bkM4NWdVbXY5cmlWeVBOQUJ1ckZVSzBO?=
 =?utf-8?B?anlpTU0rVXFhMjhCTVV1VGtSRURDV1VCa0JxdkJ2NFNxTjljbnZIbktZYkhP?=
 =?utf-8?B?dlRBU3VIS2ZqWVhLblpQS1dlTnVoajFvZW9zRGdOdWQ2ZGdHNE9PV3NXRU9E?=
 =?utf-8?B?S25qdkVrZVl5VUY5cTFSN1A1d3ZDZ080ZXFwL05RdW5oTUFrenZrRDBlVjBZ?=
 =?utf-8?B?bHdHdXk0bUVlWmpPUnZiOUpsU1dnNXVZTHczc3NTV0RlUVppOXlFaFNITzQ1?=
 =?utf-8?B?a2owU3lsaTRscWZmYllZbm05OER5UGtmQ2xiT3E2RkxDS3A5cCtzUXl3Mm45?=
 =?utf-8?B?NDRxRHJtNlI0R3lmQlYzNjhMUG9iVGZnSnVUSVlTaXZ5UGl2cVQ1RG41bHJN?=
 =?utf-8?B?VnZIcjAyT3VXYnZUa2EyUVRpU1VTaVBNWWwrZlI4Tks5MDc0dVJlcjIwY1Vu?=
 =?utf-8?B?UTdDeXhHL2RDUGRCODN4bU5FUDYrYUd4cktrb1d1SjFkam5BdDFtQ0pIYlhp?=
 =?utf-8?B?b2hmdGx6eEIzTmJwNDVhOTU3cndvN244UFpzU1U0Q2J3eXF3MlVWU1hYQ3VH?=
 =?utf-8?B?VS8zZWRCOFFnYUtiNzZGMFdGRHBNeXVwV3JKOEt6b2VPdnl3WmZCV3ZXbHYw?=
 =?utf-8?B?d1VNeE9IR2pYajVodWM1ejlsUXVwM2JWbHhLRUtvRnVYNTkwdUlqTHQ1RDJo?=
 =?utf-8?B?UjlVSWxBL1VVdXNUU1dGNWUzTXIyZURhL21pcTJMNmpoY2lZU3k0SkJTZGs2?=
 =?utf-8?B?d2RjUWM4bFl6bHFCSXltTXFxVEd0cjhYdklaa2puMllQOS9GdzI4QkRDOUZX?=
 =?utf-8?B?SVBLS0drZEV4VlJFNDlTRUZBN1FiZldYL3ZzNys0cTRCbEVKSHhIc3R1a2Yr?=
 =?utf-8?B?Tjc2aXBuWXI0dkVRNEd6RUNGR05pTjRGaGV1RDAvTzIvYmN0aVRRZ1pqSHNm?=
 =?utf-8?B?SkVlWGthNjFma0FaZlpQWkFTaXN4ckp3QmcyeUY2Y0p0dEM2V3lMU2w4V05W?=
 =?utf-8?B?dlU0MEhlYjFlQnhKcDBCUkdWUmcrc2JsYklJT1JMeE5BU1pvSm9FbUE4RS9H?=
 =?utf-8?B?Tm5JL2RkQlJZTFdWVmdnQ2RQN1lhMDJVRWZ3NDcyTTVyUUlhTnc4THBia3hW?=
 =?utf-8?B?VlREbit6SytHOFQ3U3VnRXREaW9hN3FKcll4TE9zaXNkeXN6NzYwT2E1L2RT?=
 =?utf-8?B?R1plOGpad0x2S00vaE5JUXhRYzlvOER4aFRCVnpEQWlTUUg4QUo1SDVqYWJJ?=
 =?utf-8?B?L21Gc3BManpUKzc5d1pMQWJqOG1XdXAxRldhMUJ5K2dEM1JJM0F0emJydHR5?=
 =?utf-8?B?aE1tTVhsbGltZ3NaZDNkcUprNHVIN204N2xya25mMFB0TGJpdm9vQkhld0xr?=
 =?utf-8?B?ZHNRaXNzcEQrY1h2b2VNYnI3YTNSdm8zVVJCQm10YTBZbmxGQUxObjNoUzk2?=
 =?utf-8?B?bHdmY3ZKTXFFazRseVZzcXFpY3h1ckhFakZmdDFUTXc0NHVLTDVrMDJqNU5U?=
 =?utf-8?B?SU9kMmNNMHo2ZU94NnFhWEJ6MWQzVTFxU2l2T2VsZml1dmttOWY3anU1L05E?=
 =?utf-8?B?bGVFVldEUTludU1NQlVhdUZVaDg3bWVpZllCbkRRMmtsTFoyU1hlVkNjcHlE?=
 =?utf-8?B?eG9hM01USUl0NWJjelRKSUNXRDBlTFVlTUZIWjNIZGhXQ1R3cVk0eHJTdGNH?=
 =?utf-8?B?dTE3Y3ZVb1NYS280a1FxemdicDdGbUpKSTByakNESXNpWEdValEwV2pJWVh4?=
 =?utf-8?B?dUxNZTAydkpmTWREMWxLeE5NNTh3Um00ZmJlTUNxUVZVUVBpZURmM29Lc2hQ?=
 =?utf-8?B?SlQzcVA3c1BaRXJFM0MwWXhRenNhb1EzaDRCYlNNVCtUWTF0Ri83TDNkY1N1?=
 =?utf-8?B?NW5qa20rL1lHcG44ejJvbVA1VWlHT0dGeXl2eko3V1VQVTdldUovK2NiSFF0?=
 =?utf-8?B?UUpVaWl0UlFFTjhJcHRrcDJHdjNLZGdlaFg3L2tBc1pjWlV1NkljVFdybmly?=
 =?utf-8?B?OTFUSit1aUFPeW0rUEFoS3lBcVM1Sm9wTjJQTGxKNm9LUkpKZUdXZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5755d2fd-7d55-4b6c-b7c1-08ded2143c99
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:15:49.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Urs+l2SRmQOapufWqaWwFEu4gq65a43x9lhLlTfI68V6TvfYNR8wI95d0qXn3mPiyjjEiDQybTIz1bp9o3OZBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_101557_039401_47B4D00F 
X-CRM114-Status: GOOD (  19.80  )
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

On 2026-06-09 08:43, Nicolas Frattaroli wrote:
> From: Werner Sembach <wse@tuxedocomputers.com>
> 
> Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check that was performed in the
> drm_mode_is_420_only() case, but not in the drm_mode_is_420_also() &&
> force_yuv420_output case.
> 
> Without further knowledge if YCbCr 4:2:0 is supported outside of HDMI,
> there is no reason to use RGB when the display
> reports drm_mode_is_420_only() even on a non HDMI connection.
> 
> This patch also moves both checks in the same if-case. This  eliminates an
> extra else-if-case.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Tested-by: Andri Yngvason <andri@yngvason.is>
> Reviewed-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ba7f98a87808..dfe97897127c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6917,12 +6917,9 @@ static void fill_stream_properties_from_drm_display_mode(
>  	timing_out->v_border_top = 0;
>  	timing_out->v_border_bottom = 0;
>  	/* TODO: un-hardcode */
> -	if (drm_mode_is_420_only(info, mode_in)
> -			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
> -		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
> -	else if (drm_mode_is_420_also(info, mode_in)
> -			&& aconnector
> -			&& aconnector->force_yuv420_output)
> +	if (drm_mode_is_420_only(info, mode_in) ||
> +	    (aconnector && aconnector->force_yuv420_output &&
> +	     drm_mode_is_420_also(info, mode_in)))
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
>  	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
>  			&& aconnector
> 


