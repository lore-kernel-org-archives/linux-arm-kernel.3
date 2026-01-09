Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595BAD232F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oi1xy2R9LRyzfhN0kx0QcRnu4Cnqw2dwtziMBKbDwP8=; b=jgt9WMP+0xTSqzCy+iVOrs4ljs
	juN3XWOCsFuhy1WkzPZmOpVh5rpEJNjIH71U68NutqDVYBHNhjOCP280qdjVKZgpUnnAA+Unksc92
	l8YwYLd93hXDHYZy/P1b+vV//1VhyB8myBruvDtOZ+2/lSowYXHrRgXI/hmQ2OGXHUToySU64MpB5
	6gCNbIwd2T6/vKermB+c9m9iNzOL0/Rr+XKVl2tXjlUtIuE3BjDq3sQ7Kzc0Xe97gRNL3FrYtPG9l
	6K/oAbvC2mmsfJjHFdcRr6ZKYLvEVlQR5hrZI8h5AAaMTCt7HLUxEtDMByOzHvAIJVF5QIhAZ7MfT
	Bv8r0ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ur-00000001yrG-2ver;
	Fri, 09 Jan 2026 09:09:29 +0000
Received: from mail-northeuropeazon11012007.outbound.protection.outlook.com ([52.101.66.7] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Um-00000001yqW-1f47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5YdS4fes2ZOcyJlUzYP1qJErTjYh7y/0uS8wM0/c7vj0jsWXbE3ot1nzUovwg/QyX7IaYHefMx3igXKF/g/tg2e2KZvku3dMsBaRw1lpIezPoJmSm9YaoC38E/c/Mw5QpG99F4Bg4Bu/ZA/O7TEjZlt40N8cLn/SVVBCv0edB72EbfAVBsU7NGoMGcr3v1cOkRAT+gj42IkgtdamImChrTPvSbW7nf6ZoDx9Lr/BdO9Gy3RuzOfW7xNR3lrtJmomeMZGft7KXSs6z4vmV0CqCtOs5Cgx/vs6ZE9Cnr634d+LES2niBF18T3ii/blW0FQ7PY/uVNT/+mf3Gbjt+1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi1xy2R9LRyzfhN0kx0QcRnu4Cnqw2dwtziMBKbDwP8=;
 b=hWq4sBsxTq8IYfXqUfwLpyfI0ytf9JYLSAWFkaCqN5gje4AGtfx0/mEnMMf9qqlWkVVKbFWdKe+75hYwqJVO/asZikeRVo/3e6wRck2a0JHkaLMHbXOlse6QQJvdVNfjbT7h6vbS6TAvMjyxSR0EsMnHWu2uJ3SWeJfRYfqTyvwFUTbtZYsP70oPVHqXZu5N1EISubj/z52+JZykQ7YWnWoGI8Il1mXtMca1LdHxCwy7X6D3bL0adPq9fBxOQ1gEbuNP+SmyL10SkjWOQb6vCiPKGvqLoqT0535FPg3qFlg0Y3KfxrOad/FOhbVOKATZQe6sbU512lYmGIHjQ2Fkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi1xy2R9LRyzfhN0kx0QcRnu4Cnqw2dwtziMBKbDwP8=;
 b=TsQwPrmTTDBoIPWxBxpXZrNGa465GYHUwrQRuVEx5D3oWUJlCoEr/ImZ283EY6WkD7O7KurWjxVIaoDLFNxIHLXfLjVAw0YixsO1O4YZbmQtKhX9Y0mrJX9D9cqTaZYSoDvnM1dTDhHh2cDkHcxJnxxGAIB018mUT14wB7b+WS/EDURZpHN89DlwQP0ltC0W9z6mwrUmrsKPisn31anTqv3yfsqQSP6XJVxZu7W1FIJ5IXI/SXfW/yTG1PcEhGhrwuvOhsIxThegKml2a6+CcZoqJIEE8Ed0ie8xbHdbMD5oaK6fdutwBboWPBaFka+vhhJAgWiow7RSS485vWml6Q==
Received: from AM9P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::24)
 by VI1PR10MB3565.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:09:17 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::be) by AM9P250CA0019.outlook.office365.com
 (2603:10a6:20b:21c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:09:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:10:32 +0100
Received: from [10.252.25.201] (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:09:14 +0100
Message-ID: <b05d4feb-e3b7-43ab-b8bc-596302ec8c77@foss.st.com>
Date: Fri, 9 Jan 2026 10:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
 <20260108-upstream_uboot_properties-v3-5-c1b9d4f2ce8d@foss.st.com>
 <b813fe11-c7f9-46f8-a574-c4c9d8018afe@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b813fe11-c7f9-46f8-a574-c4c9d8018afe@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|VI1PR10MB3565:EE_
X-MS-Office365-Filtering-Correlation-Id: c682109d-2756-4899-17a0-08de4f5ec3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBYMUVGUW0xeUtuMlBualFiV0lmaXFBT0ZqOEJ4VHZ4dndCaGxxNlhqNGZQ?=
 =?utf-8?B?K2NFTmpicWVwbmZ5bWZZSnVabFdZUWppQWs1UVRhQzNtVURFSFRPbkRuMm1Q?=
 =?utf-8?B?a3hvT1dESFhaK3hNRGY2QlNxb254UWZhZlB2SGV3enpuY2pRMnhiTjhPenRY?=
 =?utf-8?B?aVJVWkx0bUhJWFlNWWIya0V3WjhDL0N6ZTVoZDljQUY1djFTQlNIeFMxQXI2?=
 =?utf-8?B?M3NXeEtpNWNlK1E4M3p5VDJ1RmVYODFsOWtUdEFhZGkyRUtMUXc2ejlyTGNa?=
 =?utf-8?B?a0FCNExacmxEb0hHbW1xVS9qWklzUTZGRzVIMUY1b08wa3VTSUZxdFV5VW1X?=
 =?utf-8?B?WkdIMzc2TTNyV0gwdDNPajBmY1BIWVN1amxCY2VSOURsNjhLblJTMHN2dVVl?=
 =?utf-8?B?MzhtbHBxUHBiL3VDZ3hRZzQ3M1hwcmFUOGJhVmVwUVQ5aVBueXFrZjlOWDBq?=
 =?utf-8?B?MkxIeUkvcG11U1Y1emFWdmlHcTROOUJlUU5XQnkycFZuQkxDUzVXQXkweVFX?=
 =?utf-8?B?SWhvN0ZQazh2OC9NZnFiNUU3c2lEL3ZiVWtJVXl5RFZZTThsLzRaOVVOK2Nz?=
 =?utf-8?B?dXdwcDYwNVZTQmdvTnd0enNXalB5VTUyU3hlMzVMWG8zQ1NVd1hRWEUyMDly?=
 =?utf-8?B?dUU1Zk14c3dNa00veWV3NUIzMkdOTDRvQkVxVVV1bnJOM1FDNW90VVlITG1s?=
 =?utf-8?B?cG1zbVdjV1d1RjdZYWpHdXcxY2VmTkxpaitEZThST0lyVWhWMlJKS29rOXk3?=
 =?utf-8?B?NVVSL3RhSEZqVENXazFYRy83eE9MeWdLUGw3K21BTjR6YTRBRW5FcGpVaXZu?=
 =?utf-8?B?Ukt4dllJbWxwZDFEeHVvRW9XY3d0VWtSZlFON2NsdC9JWUwrSGVOZ3JrQ3NG?=
 =?utf-8?B?VzVmZnJjTFJwcDhyT2FPc0w1dXd5L2NSSjBqQlNOVTZaaHdUVGcwMEhQRXBI?=
 =?utf-8?B?VzRGTTljd3FaaENIaXd5Y0ZNRDBzSlZ0QjFqR294K0Vaanh5TWNvY2g2Q0hI?=
 =?utf-8?B?aVJEa0JQMEtSZURrV0dmblM2U3FUZUZsbjJZd2VERzFCUHJKak5Qc05XbmVQ?=
 =?utf-8?B?TUI3VmM4OGg5amZnbUVFRUxtM0pXK3RTem90b2gyVkFFTEdaR1lJSW1ydnRI?=
 =?utf-8?B?Vkc0UmMyZlNxTDZ6UkNRakR0TGNjNUpSUmptOTBENzBFVnc3YW5OTE05SVE1?=
 =?utf-8?B?cFRKYXhHQUxybmQ3NXlteWYyTi81L2JqS2o5ektPYTcwK3IzQnU5OEhLMWR3?=
 =?utf-8?B?dnUvYzYxU3J1K0daMjBraS9WL0dlN0dyaDZadWRhbzV3Ym1XSzFySnJndk95?=
 =?utf-8?B?ZWNJUVBnZXZxRTNKSkpRbFphcHFzODFSQ2FFL21pc2FOS1RrY2VTWWJ0a1M2?=
 =?utf-8?B?MFJUQU9SNElHUzFLZVExYStRYzZLNkFJb1gzSG1QWlFhSWcxcUZsYkZwcWJN?=
 =?utf-8?B?M1hYcHUyeXMrTjI3NWNQazViWFFKTXFCaHdKZzJyUG84c3FHK0ZIQjV5aVRt?=
 =?utf-8?B?MTFaajhkWUJ1bW1RWDJXMEE1cWw4SEoxaXZEa1E0emhDbWhxV1lEbTNwaEpT?=
 =?utf-8?B?eUZJSE9RbW43d1FZcWJ2MEFqQWhHcTVxNEdIaThJMDZkd29sZ2hYbXRXWG0y?=
 =?utf-8?B?ZExySWdTV21mV0FPM1ltL3M3RGhDQ3ZORDRNcUpGWDJ4V2pYTzhPYzhXVEVJ?=
 =?utf-8?B?NFppak9zZERPOFo4Zm5nWFFsMVZCVXIzYkN5NzdPL3dadTNnUWxrSGJoekFo?=
 =?utf-8?B?SERxRWxpUnRzeC9VWFNvZDVzR2dCNkd2Q3dTNkl1NnQxYzgvSFdpVndLUHNU?=
 =?utf-8?B?NUFYSUVoRWN6RE05ZzJjUHNzK0dubFlzYjdpZXFKWFVJK3dqQ2NCSEJmc3Zv?=
 =?utf-8?B?TzhCdURsZSs4VHd5YkkrMm82RVV0T1ZoWWhsNC9ySTBSeGw3dDAybmx2V05z?=
 =?utf-8?B?UnhLaWNlUzR2eG5WNmZwZjhiSGE1R3ZpVTBYejBZNVJqT0RqSzAwcUxmMmZ4?=
 =?utf-8?B?M3J4M1cwNVcvSXA4WHNBRzlwejlIZFFNSWtTRVNwdkpsYkNVWnhiSXlJQ2R6?=
 =?utf-8?B?UUdpRzdaUnZIWjRWc2MxUjFhbVkwRFJKbWtyYWZZS0tIbm1EOVgwT3hvMFl3?=
 =?utf-8?Q?k6fM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jw8QOJDf0d31clsCHPFc5y3NfATf3jOzxeT+xNV4zuapF1j+Fnc1v9yd9ml6bcOZPudxrJjdFs6vgAKhnqXxe0pbhNmjLmgioKuqg2QGT9ppBzTh51/YO2Nl0Asf7qJlZQznTby4iCNiGuxtMZm4+i/WQGWND6iNgMeKPXHvKwD7YdbIS4vnI0vypkmFjZKVcxQI6At5CopRge4W/V3swh7rxAc1+SxDCZz6aS7q22drdRI2PL8kNYY3LNLKSjbrB8Vx+5jV9MOxfFxL7zRPxI0reErxLMoCcM8iIWodP7tlnxF9hkb0MmTTR1FD5xfhE8Rw+2lKSeI+741WrVvnCLElPeX1noUBGwRgOXDDcFRTudhKRUhLtczxChb+WZK3g3EpYDVjS739eSDVlRqehqsn2F9rGqyexAsWaTfR2S1Ra2Ab7x5Qip23056lLz9p224A3FwdHQ4NhU80HqHQJ+WVLSgCHHkZRTsWu6tYDqKRS69OQuwHWc7EpRPQS/IsOXxoB+RPFuNmvzXKjGJGPt7yzJexCtkKWXb6j5PJ0SnX0g+yusrI0Y2M8JG0rfXRmhKQN0ghsJX466GMdQ9HaXNnysX72EiAMArGWSqQUburBhs2z6vKRoB9+SfZQ6cz67UHKsAjzF6KAoBgjUqSWbp4wU61FDlYtlAR54GokBMfzjilMTrIavTc11Je5Nzl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:09:16.1060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c682109d-2756-4899-17a0-08de4f5ec3b3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010924_808825_1D0FD3C6 
X-CRM114-Status: GOOD (  13.72  )
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



On 1/9/26 09:19, Alexandre TORGUE wrote:
> Hi Patrice
> 
> On 1/8/26 18:16, Patrice Chotard wrote:
>> The bootph-all flag was introduced in dt-schema
>> (dtschema/schemas/bootph.yaml) to define node usage across
>> different boot phases.
>>
>> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
>> present in all boot stages, so add missing bootph-all phase flag
>> to these nodes to support SD boot.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
>>   arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
>>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
>>   arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
>>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
>>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
>>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
>>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
>>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
>>   9 files changed, 290 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
>> index 98552fe45d4e..c58d81f505be 100644
>> --- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
>> @@ -13,6 +13,7 @@ optee: optee {
>>               method = "smc";
>>               interrupt-parent = <&intc>;
>>               interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
>> +            bootph-some-ram;
>>           };
>>             scmi: scmi {
>> @@ -20,6 +21,7 @@ scmi: scmi {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>               linaro,optee-channel-id = <0>;
>> +            bootph-some-ram;
>>                 scmi_clk: protocol@14 {
>>                   reg = <0x14>;
>> @@ -64,6 +66,26 @@ scmi_usb33: regulator@2 {
>>       };
>>   };
>>   +&iwdg2 {
>> +    bootph-all;
>> +};
>>
> 
> node update useless as already done in stm32mp151.dtsi

you are right, i will remove this node.

> 
>> +&ltdc {
>> +    bootph-some-ram;
>> +};
>>
> 
> ditto


ok> 
>> +&pinctrl {
>> +    bootph-all;
>> +};
>> +
> 
> ditto

ok> 
>> +&pinctrl_z {
>> +    bootph-all;
>> +};
>>
> ditto
ok> 
>> +&rcc {
>> +    bootph-all;
>> +};
>>
> 
> ditto

ok> 
>>   &reg11 {
>>       status = "disabled";
>>   };
>> @@ -72,6 +94,10 @@ &reg18 {
>>       status = "disabled";
>>   };
>>   +&scmi {
>> +    bootph-some-ram;
>> +};
> 
> Already define at the top of this patch.

ok

Thanks
Patrice> 
> 
> 
>> +
>>   &usb33 {
>>       status = "disabled";
>>   };
>> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> index b1b568dfd126..7abee7ce0580 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> @@ -33,6 +33,7 @@ arm-pmu {
>>       psci {
>>           compatible = "arm,psci-1.0";
>>           method = "smc";
>> +        bootph-some-ram;
>>       };
>>         intc: interrupt-controller@a0021000 {
>> @@ -54,34 +55,41 @@ timer {
>>       };
>>         clocks {
>> +        bootph-all;
>> +
>>           clk_hse: clk-hse {
>>               #clock-cells = <0>;
>>               compatible = "fixed-clock";
>>               clock-frequency = <24000000>;
>> +            bootph-all;
>>           };
>>             clk_hsi: clk-hsi {
>>               #clock-cells = <0>;
>>               compatible = "fixed-clock";
>>               clock-frequency = <64000000>;
>> +            bootph-all;
>>           };
>>             clk_lse: clk-lse {
>>               #clock-cells = <0>;
>>               compatible = "fixed-clock";
>>               clock-frequency = <32768>;
>> +            bootph-all;
>>           };
>>             clk_lsi: clk-lsi {
>>               #clock-cells = <0>;
>>               compatible = "fixed-clock";
>>               clock-frequency = <32000>;
>> +            bootph-all;
>>           };
>>             clk_csi: clk-csi {
>>               #clock-cells = <0>;
>>               compatible = "fixed-clock";
>>               clock-frequency = <4000000>;
>> +            bootph-all;
>>           };
>>       };
>>   @@ -122,6 +130,7 @@ soc {
>>           #size-cells = <1>;
>>           interrupt-parent = <&intc>;
>>           ranges;
>> +        bootph-all;
>>             ipcc: mailbox@4c001000 {
>>               compatible = "st,stm32mp1-ipcc";
>> @@ -142,11 +151,13 @@ rcc: rcc@50000000 {
>>               reg = <0x50000000 0x1000>;
>>               #clock-cells = <1>;
>>               #reset-cells = <1>;
>> +            bootph-all;
>>           };
>>             pwr_regulators: pwr@50001000 {
>>               compatible = "st,stm32mp1,pwr-reg";
>>               reg = <0x50001000 0x10>;
>> +            bootph-all;
>>                 reg11: reg11 {
>>                   regulator-name = "reg11";
>> @@ -354,6 +365,7 @@ ltdc: display-controller@5a001000 {
>>               clocks = <&rcc LTDC_PX>;
>>               clock-names = "lcd";
>>               resets = <&rcc LTDC_R>;
>> +            bootph-some-ram;
>>               status = "disabled";
>>           };
>>   @@ -364,6 +376,7 @@ iwdg2: watchdog@5a002000 {
>>               clock-names = "pclk", "lsi";
>>               interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
>>               wakeup-source;
>> +            bootph-all;
>>               status = "disabled";
>>           };
>>   @@ -404,6 +417,8 @@ bsec: efuse@5c005000 {
>>               reg = <0x5c005000 0x400>;
>>               #address-cells = <1>;
>>               #size-cells = <1>;
>> +            bootph-all;
>> +
>>               part_number_otp: part-number-otp@4 {
>>                   reg = <0x4 0x1>;
>>               };
>> @@ -1876,6 +1891,7 @@ pinctrl: pinctrl@50002000 {
>>               ranges = <0 0x50002000 0xa400>;
>>               interrupt-parent = <&exti>;
>>               st,syscfg = <&exti 0x60 0xff>;
>> +            bootph-all;
>>                 gpioa: gpio@50002000 {
>>                   gpio-controller;
>> @@ -1885,6 +1901,7 @@ gpioa: gpio@50002000 {
>>                   reg = <0x0 0x400>;
>>                   clocks = <&rcc GPIOA>;
>>                   st,bank-name = "GPIOA";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1896,6 +1913,7 @@ gpiob: gpio@50003000 {
>>                   reg = <0x1000 0x400>;
>>                   clocks = <&rcc GPIOB>;
>>                   st,bank-name = "GPIOB";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1907,6 +1925,7 @@ gpioc: gpio@50004000 {
>>                   reg = <0x2000 0x400>;
>>                   clocks = <&rcc GPIOC>;
>>                   st,bank-name = "GPIOC";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1918,6 +1937,7 @@ gpiod: gpio@50005000 {
>>                   reg = <0x3000 0x400>;
>>                   clocks = <&rcc GPIOD>;
>>                   st,bank-name = "GPIOD";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1929,6 +1949,7 @@ gpioe: gpio@50006000 {
>>                   reg = <0x4000 0x400>;
>>                   clocks = <&rcc GPIOE>;
>>                   st,bank-name = "GPIOE";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1940,6 +1961,7 @@ gpiof: gpio@50007000 {
>>                   reg = <0x5000 0x400>;
>>                   clocks = <&rcc GPIOF>;
>>                   st,bank-name = "GPIOF";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1951,6 +1973,7 @@ gpiog: gpio@50008000 {
>>                   reg = <0x6000 0x400>;
>>                   clocks = <&rcc GPIOG>;
>>                   st,bank-name = "GPIOG";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1962,6 +1985,7 @@ gpioh: gpio@50009000 {
>>                   reg = <0x7000 0x400>;
>>                   clocks = <&rcc GPIOH>;
>>                   st,bank-name = "GPIOH";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1973,6 +1997,7 @@ gpioi: gpio@5000a000 {
>>                   reg = <0x8000 0x400>;
>>                   clocks = <&rcc GPIOI>;
>>                   st,bank-name = "GPIOI";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1984,6 +2009,7 @@ gpioj: gpio@5000b000 {
>>                   reg = <0x9000 0x400>;
>>                   clocks = <&rcc GPIOJ>;
>>                   st,bank-name = "GPIOJ";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>   @@ -1995,6 +2021,7 @@ gpiok: gpio@5000c000 {
>>                   reg = <0xa000 0x400>;
>>                   clocks = <&rcc GPIOK>;
>>                   st,bank-name = "GPIOK";
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>           };
>> @@ -2006,6 +2033,7 @@ pinctrl_z: pinctrl@54004000 {
>>               ranges = <0 0x54004000 0x400>;
>>               interrupt-parent = <&exti>;
>>               st,syscfg = <&exti 0x60 0xff>;
>> +            bootph-all;
>>                 gpioz: gpio@54004000 {
>>                   gpio-controller;
>> @@ -2016,6 +2044,7 @@ gpioz: gpio@54004000 {
>>                   clocks = <&rcc GPIOZ>;
>>                   st,bank-name = "GPIOZ";
>>                   st,bank-ioport = <11>;
>> +                bootph-all;
>>                   status = "disabled";
>>               };
>>           };
>> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
>> index 847b360f02fc..f721c398e576 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
>> @@ -85,3 +85,17 @@ &rng1 {
>>   &rtc {
>>       clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>>   };
>> +
>> +&uart4 {
>> +    bootph-all;
>> +};
>> +
>> +&uart4_pins_a {
>> +    bootph-all;
>> +    pins1 {
>> +        bootph-all;
>> +    };
>> +    pins2 {
>> +        bootph-all;
>> +    };
>> +};
>> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
>> index 0da3667ab1e0..c4581e28504a 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
>> @@ -23,3 +23,46 @@ chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>>   };
>> +
>> +&i2c4 {
>> +    bootph-all;
>> +};
>> +
>> +&i2c4_pins_a {
>> +    bootph-all;
>> +    pins {
>> +        bootph-all;
>> +    };
>> +};
>> +
>> +&pmic {
>> +    bootph-all;
>> +};
>> +
>> +&sdmmc1 {
>> +    bootph-pre-ram;
>> +};
>> +
>> +&sdmmc1_b4_pins_a {
>> +    bootph-pre-ram;
>> +    pins1 {
>> +        bootph-pre-ram;
>> +    };
>> +    pins2 {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&uart4 {
>> +    bootph-all;
>> +};
>> +
>> +&uart4_pins_a {
>> +    bootph-all;
>> +    pins1 {
>> +        bootph-all;
>> +    };
>> +    pins2 {
>> +        bootph-all;
>> +    };
>> +};
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
>> index 1ec3b8f2faa9..4fc670bb4cb0 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
>> @@ -79,6 +79,17 @@ touchscreen@38 {
>>       };
>>   };
>>   +&i2c4 {
>> +    bootph-all;
>> +};
>> +
>> +&i2c4_pins_a {
>> +    bootph-all;
>> +    pins {
>> +        bootph-all;
>> +    };
>> +};
>> +
>>   &ltdc {
>>       status = "okay";
>>   @@ -93,6 +104,10 @@ ltdc_ep1_out: endpoint@1 {
>>       };
>>   };
>>   +&pmic {
>> +    bootph-all;
>> +};
>> +
>>   &rtc {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&rtc_rsvd_pins_a>;
>> @@ -103,6 +118,20 @@ rtc_lsco_pins_a: rtc-lsco-0 {
>>       };
>>   };
>>   +&sdmmc1 {
>> +    bootph-pre-ram;
>> +};
>> +
>> +&sdmmc1_b4_pins_a {
>> +    bootph-pre-ram;
>> +    pins1 {
>> +        bootph-pre-ram;
>> +    };
>> +    pins2 {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>>   /* Wifi */
>>   &sdmmc2 {
>>       pinctrl-names = "default", "opendrain", "sleep";
>> @@ -127,6 +156,20 @@ brcmf: wifi@1 {
>>       };
>>   };
>>   +&uart4 {
>> +    bootph-all;
>> +};
>> +
>> +&uart4_pins_a {
>> +    bootph-all;
>> +    pins1 {
>> +        bootph-all;
>> +    };
>> +    pins2 {
>> +        bootph-all;
>> +    };
>> +};
>> +
>>   /* Bluetooth */
>>   &usart2 {
>>       pinctrl-names = "default", "sleep", "idle";
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
>> index 6f27d794d270..00d4855f9a85 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
>> @@ -90,3 +90,17 @@ &rng1 {
>>   &rtc {
>>       clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>>   };
>> +
>> +&uart4 {
>> +    bootph-all;
>> +};
>> +
>> +&uart4_pins_a {
>> +    bootph-all;
>> +    pins1 {
>> +        bootph-all;
>> +    };
>> +    pins2 {
>> +        bootph-all;
>> +    };
>> +};
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> index f6c478dbd041..f63a3d68d2b4 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> @@ -168,7 +168,9 @@ &i2c4 {
>>       i2c-scl-rising-time-ns = <185>;
>>       i2c-scl-falling-time-ns = <20>;
>>       clock-frequency = <400000>;
>> +    bootph-all;
>>       status = "okay";
>> +
>>       /* spare dmas for other usage */
>>       /delete-property/dmas;
>>       /delete-property/dma-names;
>> @@ -179,6 +181,7 @@ pmic: stpmic@33 {
>>           interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
>>           interrupt-controller;
>>           #interrupt-cells = <2>;
>> +        bootph-all;
>>           status = "okay";
>>             regulators {
>> @@ -314,6 +317,13 @@ watchdog {
>>       };
>>   };
>>   +&i2c4_pins_a {
>> +    bootph-all;
>> +    pins {
>> +        bootph-all;
>> +    };
>> +};
>> +
>>   &ipcc {
>>       status = "okay";
>>   };
>> @@ -365,9 +375,30 @@ &sdmmc1 {
>>       sd-uhs-sdr25;
>>       sd-uhs-sdr50;
>>       sd-uhs-ddr50;
>> +    bootph-pre-ram;
>>       status = "okay";
>>   };
>>   +&sdmmc1_b4_pins_a {
>> +    bootph-pre-ram;
>> +    pins1 {
>> +        bootph-pre-ram;
>> +    };
>> +    pins2 {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&sdmmc1_dir_pins_a {
>> +    bootph-pre-ram;
>> +    pins1 {
>> +        bootph-pre-ram;
>> +    };
>> +    pins2 {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>>   &sdmmc2 {
>>       pinctrl-names = "default", "opendrain", "sleep";
>>       pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
>> @@ -381,9 +412,27 @@ &sdmmc2 {
>>       vmmc-supply = <&v3v3>;
>>       vqmmc-supply = <&vdd>;
>>       mmc-ddr-3_3v;
>> +    bootph-pre-ram;
>>       status = "okay";
>>   };
>>   +&sdmmc2_b4_pins_a {
>> +    bootph-pre-ram;
>> +    pins1 {
>> +        bootph-pre-ram;
>> +    };
>> +    pins2 {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&sdmmc2_d47_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>>   &timers6 {
>>       status = "okay";
>>       /* spare dmas for other usage */
>> @@ -399,11 +448,22 @@ &uart4 {
>>       pinctrl-0 = <&uart4_pins_a>;
>>       pinctrl-1 = <&uart4_sleep_pins_a>;
>>       pinctrl-2 = <&uart4_idle_pins_a>;
>> +    bootph-all;
>>       /delete-property/dmas;
>>       /delete-property/dma-names;
>>       status = "okay";
>>   };
>>   +&uart4_pins_a {
>> +    bootph-all;
>> +    pins1 {
>> +        bootph-all;
>> +    };
>> +    pins2 {
>> +        bootph-all;
>> +    };
>> +};
>> +
>>   &usbotg_hs {
>>       vbus-supply = <&vbus_otg>;
>>   };
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
>> index 6ae391bffee5..bcf80f76d6bc 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
>> @@ -77,6 +77,31 @@ &optee {
>>       interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
>>   };
>>   +&qspi {
>> +    bootph-pre-ram;
>> +};
>> +
>> +&qspi_clk_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_bk1_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_bk2_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>>   &rcc {
>>       compatible = "st,stm32mp1-rcc-secure", "syscon";
>>       clock-names = "hse", "hsi", "csi", "lse", "lsi";
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
>> index 8f99c30f1af1..879436cbb72d 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
>> @@ -262,6 +262,7 @@ &qspi_bk2_sleep_pins_a
>>       reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
>>       #address-cells = <1>;
>>       #size-cells = <0>;
>> +    bootph-pre-ram;
>>       status = "okay";
>>         flash0: flash@0 {
>> @@ -283,6 +284,41 @@ flash1: flash@1 {
>>       };
>>   };
>>   +&qspi_clk_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_bk1_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_cs1_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_bk2_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>> +&qspi_cs2_pins_a {
>> +    bootph-pre-ram;
>> +    pins {
>> +        bootph-pre-ram;
>> +    };
>> +};
>> +
>>   &sdmmc3 {
>>       pinctrl-names = "default", "opendrain", "sleep";
>>       pinctrl-0 = <&sdmmc3_b4_pins_a>;
>>
> 


