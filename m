Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E73C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wfZrVG/LCiSdyDay+UI1R9YSljTpTNbQFjaRNleIqc=; b=MToqAXIjrJqLJ9cQf49uuLZRfc
	8+7iYR16yQ9yIsQI2MAsN8LCfHdggyrN7ax+/HhHJIf5l+A7uoe5xUZGWsTJWsDErxeqiQdqbigsp
	chBrJn2EkSVKOI6zUfUTHmn9iANRELnJcJS4hRv5wW5DO1Yu2ngXBog4GQe0IxScao4PjRoOlQcro
	haQhXfkzHHN25Wt38oj+Z41Ee6lvDHtAOSkoAxbuGtWF5QOvFJHbWRbBui/QpKadZxc4VTFdfD0jl
	4gmdDsllpFJusSewf2bZrckB3697jbDsWaVVnspo4OL8uJlISWKCCvESFgdee2C+V8yn+MThgZU3u
	dOHaPEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLm3-0000000FvPS-0Nb4;
	Fri, 11 Jul 2025 21:59:19 +0000
Received: from mail-bn7nam10on20623.outbound.protection.outlook.com ([2a01:111:f403:2009::623] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaK7y-0000000Fljg-46Tb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 20:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS9e2kxXoNrYjAHRp4lP1uw4Tf/D7cpnRhbBiEfwDcXNFTwMf9S3+hTjPDTtnkaHoXHsM0bDZVvNOaCAACvqMz6S54iTIs6u64KxnWlSE3S6HuqZKw68XgjRU7D+NXGTzZmQ87S4NfTN5j2/kMz9hiGYXPFz3VtPQuZtOP50+xbxJ4e736P1JqMv1h75Kt7NFF7rdojZHOXhg1YzVYkTQ62bWj8lNDm7sKjtO2n8c4c8b7jWkYaNdHCkoBUeFktRTuSoa0oMJ03WQBvs16mDq1jPdeuAWOGYlnoGX2nraiC1LEHvLZtAHj5MtDWUt0F3ysQwfNZGEx69pQEVY/t6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wfZrVG/LCiSdyDay+UI1R9YSljTpTNbQFjaRNleIqc=;
 b=zKYdu90fcwroVYEd8nQ4OmbTH+pQJheJYBJ04B3l05yvNti0sgy7RWIZHHWxBojdF3Zq9xFsRUY7w5RvUvli4+CYHfrVnEO8e3Xdln2AAf9oGfnQu8HukZlZ0F/d9JY8/7YpMyhH9YrQXfLOkFkC9pIN4GuggYPO4bHfj4ocSoSOJmyGuKBkiv95a6z0Th12f3aI95gBL4Tt6BJueDNa6IawqhZE+Prwq9rdEgyqkfp5UGuMhyc4DJQZ3tnYnPW3PTpQZblMMf072gdvqWnWbuSVSgwJpkyI2owfT0RqdecRZ4jKbvHPG4dV3sb8EyS7HFDiFoQ35XWyMUsd9bNMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wfZrVG/LCiSdyDay+UI1R9YSljTpTNbQFjaRNleIqc=;
 b=E6rC53zETRQAqIAaZJPq/p+shKJ/2HBnWSiFFRyu/lPagyylLAN+EQiBw0rufeynaNs1j+rHoPfraXVnmsnLh8ixwZdhRsVcPYya8Bh3Y32afHBw7qyNaIl5aiqW6p+vIvYjWyxvEd/gnF1kJpPDDjtkaCqZqRrl+YcdSewU7iU=
Received: from BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 20:13:41 +0000
Received: from BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6]) by BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 20:13:40 +0000
From: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
To: Subbaraya Sundeep <sbhatta@marvell.com>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "Simek, Michal"
	<michal.simek@amd.com>, "vkoul@kernel.org" <vkoul@kernel.org>, "Pandey,
 Radhey Shyam" <radhey.shyam.pandey@amd.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: RE: [PATCH V2 2/4] dmaengine: xilinx_dma: Fix irq handler and start
 transfer path for AXI DMA
Thread-Topic: [PATCH V2 2/4] dmaengine: xilinx_dma: Fix irq handler and start
 transfer path for AXI DMA
Thread-Index: AQHb8YNHpeZhiJhmK02RKxccZmW+YbQtHfwAgAA7PzA=
Date: Fri, 11 Jul 2025 20:13:40 +0000
Message-ID: <BL3PR12MB657159BD5F7C2161D6B9A5AAC94BA@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-3-suraj.gupta2@amd.com>
 <aHE7II-tL6zAzNYB@ff87d1e86a04>
In-Reply-To: <aHE7II-tL6zAzNYB@ff87d1e86a04>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-11T19:58:35.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6571:EE_|BL1PR12MB5897:EE_
x-ms-office365-filtering-correlation-id: d1823b46-95c9-4d0e-40e6-08ddc0b76d54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?5Z1fXd2S8Z+eJB/3vTyouUPqDzR0bru2yPs8vM1fFgWeBpk+0BMGP1+U5Z?=
 =?iso-8859-1?Q?2cOSBNqg7Nch5nOVo/j5ML4ZXbB3hH1W3aKVGbnX1FfZ5MmCxgf2+w4KlH?=
 =?iso-8859-1?Q?tWhBLw1Co40i1e7Fd+SegnaTDacPV0Qs50P++d/b3pXr6zEZwdnoks7vSq?=
 =?iso-8859-1?Q?J6/mOA0leoCyYZm1dhrF51KvyhlgJ2Q0fm8C1o59ShECBfnWiOQT3tfnir?=
 =?iso-8859-1?Q?ZPMeRYF9l0/8hrnjzK0f5UvY3bhVKp5aFcGHT2UkW+vJVG1czWUERUzWRv?=
 =?iso-8859-1?Q?/M6tC23hgR9a2o/yXwDHEVZywbkNW+zriEHiWuTSNxK+SFBSDVHHfkBLzZ?=
 =?iso-8859-1?Q?AWuvptN67+ay2sZIrJwoDfPJx8GJ53vbZkNs/gNO8po/WMaDyKRpyvnOuI?=
 =?iso-8859-1?Q?v4wgStq1IC2JyKD/ZqVRqQmW1NWMoBjKoHWa2Zz67hiC3kEPjN82lg6k8U?=
 =?iso-8859-1?Q?5DD9xi/1CRv3jikvOC6t3h8wXFFNRO1f5jbdi5HJyzRjNecfn+9dClc4Rj?=
 =?iso-8859-1?Q?IkrrntemsBLGT8BDNUt5hT+EtQA+1tQWJau/lWLz5eEeFCaB0ozdeniRiS?=
 =?iso-8859-1?Q?GBwDIB3LY57bDxKWB5NF/cfbp4hHkth77JDJK3P5eZLzK+15hF9NFGPztr?=
 =?iso-8859-1?Q?PbCuzqxau0Y9XY5nIpPOlPZQwthBa4imnGITUrayfM9O4wEYUqd4Oi8Qfp?=
 =?iso-8859-1?Q?/ifv9D09tpod3VmzvOOt68GUjy8nh6RgnMRDVxjAEY4yg2b4LQ/sK8IOuI?=
 =?iso-8859-1?Q?ch045LXyLAw70X1+Kx105Q4Q1qrEIVVFd/vKmOUSJcNX5rjMJEbPWx4fhk?=
 =?iso-8859-1?Q?4JRifsAWi/2EeDz9FLY43o3lY8RZ8pN9BAzHpBzcvOixTJdk746glImRpx?=
 =?iso-8859-1?Q?tH13uWtMpeOdLgv3iI1/VxPYNb9JWXsSjEcH+17PWIdjGwTlSowvjb9aO/?=
 =?iso-8859-1?Q?uHdrFJHR7YsaNd2MsKXHcGGgzYllIxXv/IQjrXv+Ct557V7TSir+Qp9p1S?=
 =?iso-8859-1?Q?6LmUQTCHBL5vj5ut1Px11YRtlsZ9/o2SEvgz/Qp2jKlG49N/Zu/MVUMsTL?=
 =?iso-8859-1?Q?77Y/KaQwN1Vk9qIch9ACArf7eqY3nC5oVd4oVDw4n4ZA+BAPnFBph4GBM9?=
 =?iso-8859-1?Q?HkLaXofPOoMMcGuS+16wt2oquYci6X6vreCvIt4NtP4WP8AbiakP5VIPVB?=
 =?iso-8859-1?Q?W+GKCU1fdIX2gSmstCmwVRNvszerGoy1R9Ss3/hjagBlUlAY0LJeXsEEPD?=
 =?iso-8859-1?Q?Q4fhEi9ZSm8CSX8Rx+InVOMUjTgcMgHDw9FmEH6Gp8TURKrRXVCRlFW1/W?=
 =?iso-8859-1?Q?EN1N6saJW1XXYbMCRLO5UPzwpTbLlr1JyMuW58SJR5v8mnMInqUbyig2py?=
 =?iso-8859-1?Q?zR7pi6Nb/dASTBKgcjOYHMlonSHk7b8AFXIx/8gPUGyvZxhDqMhT/bF+q1?=
 =?iso-8859-1?Q?Lnuwvsl2cb01u+wty3+cYnEKNBzBfksk1HFT7FtXOdrXBIE3Y0SG3+X0i2?=
 =?iso-8859-1?Q?AJBx9LKkm4pSa8VhNm/84CfX8tY6ah+3wgFUP6tRvAi8mIJ5dCPj4scdUl?=
 =?iso-8859-1?Q?4ZQ9lEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6571.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IwZBHplUG+3YPxB0GvhcMkLC2g9G3RnHpLXgvq2qbW3wxakj+swVGRNqc2?=
 =?iso-8859-1?Q?RmNVVu0wlT7bah7d3/nij7L0qjdzOG+Yu82YIdD2dCOkp6bWw0FLHja/hX?=
 =?iso-8859-1?Q?KLF8vJsP7RSs9tMGBNDqkgweI1SBAMv3kZpT0oNV6RSnwolm6TB8lNtdi5?=
 =?iso-8859-1?Q?uelCmLWavlDK3ZPYPrcCJXX9lcbrZcrOY4bIE43N1HK5Tx0uVyG+97gxRt?=
 =?iso-8859-1?Q?Xo2S2cILlSo4YiIP9MeOjGVUiMkE4tVpHamxdMbuXDiotM4giV4ELNPLaE?=
 =?iso-8859-1?Q?pPquMySLD9FNwsBb2xjZYzFXBTkIuGAzx6gPIvm3hN4SKt2cTDKDPDUx3Y?=
 =?iso-8859-1?Q?jlZfl+9rhN3DoS6olu2tZ9Y1HnO3p1C+RuW2Eujb/sYJB4GmQi3etq416X?=
 =?iso-8859-1?Q?lTI9LJBwbPhlOpwgE3VuGjLfLJ7kCkTYKEVxfUDu1urnMGS1ryEmgnEXvQ?=
 =?iso-8859-1?Q?/UCHbX6sjqeBO1z/uOgkrtM4823qufziRb/iO9NXMdqnBq51Qxq7Lxjciv?=
 =?iso-8859-1?Q?ode+Y7VFFBEBkBxs6tLZHYTRWIzoqAszOTPxutcM2I4h1V057BXNQeDS2r?=
 =?iso-8859-1?Q?6C/s83itmY0z6Yaht/Af7e6zQploquH92Nbp1WnmYgyei6eIQP+T0BgOP0?=
 =?iso-8859-1?Q?Tl7qqkXgmNny0lVP9NxXmlnZfyiEoUILoKIUr42Wemgzgiz08XIx7LXAsD?=
 =?iso-8859-1?Q?hWCPxL9iZcpB7/VJ2Lzt0CjCnbA7h504yorL07fYb8MdBMrMiZ/RackjET?=
 =?iso-8859-1?Q?QuIGofZyAToJYYROa76Cxfyt2In8xEIukot3XfQYY1NkTT/j0G0LJBqNSP?=
 =?iso-8859-1?Q?ySCEHfY1BQqZps/vFzF4ug9evrN88dHyCEMkAcKwSGL55jN34rByLALO5x?=
 =?iso-8859-1?Q?IWQm/UMhCc2h8MEd/VTT+245vcVjvZOb9I22YoFB/8CWZ3JZxzuym+eqM9?=
 =?iso-8859-1?Q?iMuYUbPPhgm10+GcBqaESeOT6sI5fzRWn3eznZFFJFW/rkShPWL426r5YR?=
 =?iso-8859-1?Q?YzZZ6IAmZHm0rmj3n291b3UOCiT88jMiLvs500UEXv/HOs88IqgdRY+kY9?=
 =?iso-8859-1?Q?yoy8MUpBzOf+mkSrSLTdxuCg8gI3or89el7doRKClQanwM2EyFqn8c+pig?=
 =?iso-8859-1?Q?+M009nRSiN8Nj2NkoaL71XNX4Yzg8RHa0SWlHlBYRqhvmz8OrNQSEfK7IP?=
 =?iso-8859-1?Q?l/NJAxTWO8eeNzYvL4Rt8MgjPakcQRazfHFo6qh+FGuFh4QkQUFeFfcVU6?=
 =?iso-8859-1?Q?FW0ZDywjfppeZIrefGbJW+TC+nscv4E7RO/uQ7W/CR1zrUsZFnnbudxgvD?=
 =?iso-8859-1?Q?2ZNHC8lV69+cX2RPYlO+N5rkaFToKpuwWt3xViJZR2WDa5Y7lvBye8zJ8P?=
 =?iso-8859-1?Q?hnlOQj2WUd1RpKaxuiUxnE4HfdNFaWSmF1byd1OmgPj+SFd9OkzFejjuQP?=
 =?iso-8859-1?Q?rTmpXT7cnYc0d1cfWTYipXfymfHP7cFu4IS9wYMT7RmCXdd5CrHcbHKuuz?=
 =?iso-8859-1?Q?LjzigJqGzjOUh5ww+II3FbEAt7WcAmSC8i1230mNbSKTk22X436TfqaTHn?=
 =?iso-8859-1?Q?4CCe4h/O1P6PBAN99HYAwmKfc0WnaQ4W0oihotrsHWmz/iWcXEzCK0/d12?=
 =?iso-8859-1?Q?ScvlA0uMuCBOs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6571.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1823b46-95c9-4d0e-40e6-08ddc0b76d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 20:13:40.2208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1tEvpj9ZksSLOJcMoTWHzee8Se3xodQrPP/xZNqqZhKYtpeIvgQfjjnlGSFz/y1Ltclw1GwuzkT9aL6KjEJfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_131351_057926_AC510300 
X-CRM114-Status: GOOD (  25.80  )
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

[Public]

> -----Original Message-----
> From: Subbaraya Sundeep <sbhatta@marvell.com>
> Sent: Friday, July 11, 2025 9:56 PM
> To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> Cc: andrew+netdev@lunn.ch; davem@davemloft.net; kuba@kernel.org;
> pabeni@redhat.com; Simek, Michal <michal.simek@amd.com>; vkoul@kernel.org=
;
> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>;
> netdev@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; dmaengine@vger.kernel.org; Katakam, Harini
> <harini.katakam@amd.com>
> Subject: Re: [PATCH V2 2/4] dmaengine: xilinx_dma: Fix irq handler and st=
art transfer
> path for AXI DMA
>
> Caution: This message originated from an External Source. Use proper caut=
ion when
> opening attachments, clicking links, or responding.
>
>
> On 2025-07-10 at 10:12:27, Suraj Gupta (suraj.gupta2@amd.com) wrote:
> > AXI DMA driver incorrectly assumes complete transfer completion upon
> > IRQ reception, particularly problematic when IRQ coalescing is active.
> > Updating the tail pointer dynamically fixes it.
> > Remove existing idle state validation in the beginning of
> > xilinx_dma_start_transfer() as it blocks valid transfer initiation on
> > busy channels with queued descriptors.
> > Additionally, refactor xilinx_dma_start_transfer() to consolidate
> > coalesce and delay configurations while conditionally starting
> > channels only when idle.
> >
> > Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> > Fixes: Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx
> > AXI Direct Memory Access Engine")
>
> You series looks like net-next material and this one is fixing some exist=
ing bug. Send
> this one patch seperately to net.
> Also include net or net-next in subject.
>
> Thanks,
> Sundeep

This series is more of DMAengine as we're enabling coalesce parameters conf=
iguration via DMAengine framework. AXI ethernet is just an example client u=
sing AXI DMA.

I sent V1 as separate patches for net-next and dmaengine mailing list and g=
ot suggestion[1] to send them as single series for better review, so I didn=
't used net specific subject prefix.
[1]: https://lore.kernel.org/all/d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux=
.dev/

Regards,
Suraj

> > ---
> >  drivers/dma/xilinx/xilinx_dma.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/dma/xilinx/xilinx_dma.c
> > b/drivers/dma/xilinx/xilinx_dma.c index a34d8f0ceed8..187749b7b8a6
> > 100644
> > --- a/drivers/dma/xilinx/xilinx_dma.c
> > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > @@ -1548,9 +1548,6 @@ static void xilinx_dma_start_transfer(struct
> xilinx_dma_chan *chan)
> >       if (list_empty(&chan->pending_list))
> >               return;
> >
> > -     if (!chan->idle)
> > -             return;
> > -
> >       head_desc =3D list_first_entry(&chan->pending_list,
> >                                    struct xilinx_dma_tx_descriptor, nod=
e);
> >       tail_desc =3D list_last_entry(&chan->pending_list,
> > @@ -1558,23 +1555,24 @@ static void xilinx_dma_start_transfer(struct
> xilinx_dma_chan *chan)
> >       tail_segment =3D list_last_entry(&tail_desc->segments,
> >                                      struct xilinx_axidma_tx_segment,
> > node);
> >
> > +     if (chan->has_sg && list_empty(&chan->active_list))
> > +             xilinx_write(chan, XILINX_DMA_REG_CURDESC,
> > +                          head_desc->async_tx.phys);
> > +
> >       reg =3D dma_ctrl_read(chan, XILINX_DMA_REG_DMACR);
> >
> >       if (chan->desc_pendingcount <=3D XILINX_DMA_COALESCE_MAX) {
> >               reg &=3D ~XILINX_DMA_CR_COALESCE_MAX;
> >               reg |=3D chan->desc_pendingcount <<
> >                                 XILINX_DMA_CR_COALESCE_SHIFT;
> > -             dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
> >       }
> >
> > -     if (chan->has_sg)
> > -             xilinx_write(chan, XILINX_DMA_REG_CURDESC,
> > -                          head_desc->async_tx.phys);
> >       reg  &=3D ~XILINX_DMA_CR_DELAY_MAX;
> >       reg  |=3D chan->irq_delay << XILINX_DMA_CR_DELAY_SHIFT;
> >       dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
> >
> > -     xilinx_dma_start(chan);
> > +     if (chan->idle)
> > +             xilinx_dma_start(chan);
> >
> >       if (chan->err)
> >               return;
> > @@ -1914,8 +1912,10 @@ static irqreturn_t xilinx_dma_irq_handler(int ir=
q, void
> *data)
> >                     XILINX_DMA_DMASR_DLY_CNT_IRQ)) {
> >               spin_lock(&chan->lock);
> >               xilinx_dma_complete_descriptor(chan);
> > -             chan->idle =3D true;
> > -             chan->start_transfer(chan);
> > +             if (list_empty(&chan->active_list)) {
> > +                     chan->idle =3D true;
> > +                     chan->start_transfer(chan);
> > +             }
> >               spin_unlock(&chan->lock);
> >       }
> >
> > --
> > 2.25.1
> >

