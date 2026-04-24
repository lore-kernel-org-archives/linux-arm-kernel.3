Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E437FB44A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 04:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/OZFVTlKXBacMFDOvu4TRCBU72cfYsR+OA/KFVFEpY=; b=3GADA+mm+vn4RV2OndxM7fWW4W
	CEsAfqo7ckMwLcgs232jXkgLTujAoB7CMm0Ezu251q5Kx7X6u6ZyZPQ8Iij/qegELhZ+n3BFawGZN
	4P6MaiyLYx8ViAXBC/hblJ72pXAoYViUXSD9ypuawuw7uQQ9MVhmsb8lph3xJKcMPr29gwEgfz1km
	VjiuTNN4cyN8Nm8yNqEUrzbkSf4FbYb20Dzyw6VF23Zq/NDtuOhL5cPy5Wwt5HT3vigGtgOF9E3KL
	TpJFZ6wSwe2V1QiPUb6NDCJAEeH5H6TylPkUz/qTNWS0MVGUmhGUw3HO2fAz1QtLw3DZkhV8jWjlA
	BZkRyYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG855-0000000CdL8-3FaK;
	Fri, 24 Apr 2026 04:23:55 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG84z-0000000CdKi-1svE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 04:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLN/yI0hFIF44NYXJOhlMzwUX7rdEN+pDMmW4Gf8XaU3u0KvN2EAqyh0MTbzg5lBhFTHP5EdRN3DruU4/EJIHmOmew6nP3Jsh+mpMKn+tjnw78i2Iyq3DJ5ehXwG7S3XP9VpAHdIzmHjRYHsYoW7MfQ4UdP1BiebHVzRXe9Dvalr83XxA6FLbfkLeC1I+gxyzJxxq36RIzNmCMvfzUcwbK7IfUbqV31+JIGelrAeXBJo47T6e0YPapXh7FXbnhr8HRJTD+W6t175qmMdqwJqY8SvPLoLYb7J1Ks0iTnsYrfwgZi2Q2cC6JcWRjxIT86qcpMqgFUCBXLE9D9rDxkfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/OZFVTlKXBacMFDOvu4TRCBU72cfYsR+OA/KFVFEpY=;
 b=YWHHtgkuc5XX+zMcX4d4xLqVAAKw0ZQcJEPwTDrJN3O1W5pBbQQqD2ssC4yjRy4r9kNCLoxV7hNXRPNEXu0wj+dl3Uo1RVvQCr69U6NMJMU3Gzygz/JK3lyFoE1i+N88ch0L9T63TJ5VHiSu18I8QSZm3Bgtk3udwusIZrdSmR4Mn+AlrwXvwOdM6ZE2v0xyb1ZmRO7zKVMqZ74SXqTW9Bt2S1pWQL1FYgAAG3qhbq/Uy7jRtZL69MN1lRCpp6r1e5m/Zec5qnc2XObbD+kUnejKfFt5pMVAwnk3/hcA+k0EZVgIwa+bGPEG+Ixrn2Rx7oSNgxFh7zlN0/I69CHKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/OZFVTlKXBacMFDOvu4TRCBU72cfYsR+OA/KFVFEpY=;
 b=BCtX4XwYRyoRyA3otV+i5N7dOHyd6a7YQpHsuxyCTv3f04TufqQciRJx5Y5Q8jG9kXVJ6pMFwG1KZDfi7BU8uwY+G/ifSKJMNa5684FghDYEpHH8OLfW1IZDXK3g4fQe1q+5Cn8r/QOds99cC4o5MGeUXDAV8QwH4wvDPAtCW2Q=
Received: from MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Fri, 24 Apr
 2026 04:23:45 +0000
Received: from MW4PR12MB7285.namprd12.prod.outlook.com
 ([fe80::ba9e:64a2:e92d:8cff]) by MW4PR12MB7285.namprd12.prod.outlook.com
 ([fe80::ba9e:64a2:e92d:8cff%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 04:23:45 +0000
From: "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>
To: "Jain, Ronak" <ronak.jain@amd.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Jain, Ronak" <ronak.jain@amd.com>
Subject: RE: [PATCH 1/2] Documentation: ABI: add sysfs interface for ZynqMP
 CSU registers
Thread-Topic: [PATCH 1/2] Documentation: ABI: add sysfs interface for ZynqMP
 CSU registers
Thread-Index: AQHcx0zTX903aE5T90CJWK3WCUdePLXttShw
Date: Fri, 24 Apr 2026 04:23:44 +0000
Message-ID: <MW4PR12MB7285CDA342976C78DD0E3BB8E22B2@MW4PR12MB7285.namprd12.prod.outlook.com>
References: <20260408114244.2852015-1-ronak.jain@amd.com>
 <20260408114244.2852015-2-ronak.jain@amd.com>
In-Reply-To: <20260408114244.2852015-2-ronak.jain@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-04-24T04:21:53.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7285:EE_|SA0PR12MB4430:EE_
x-ms-office365-filtering-correlation-id: 6013283f-76a0-49c0-99b8-08dea1b9460d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: +qdivX1uGdnAadxzPt37zSSbnaW7Ki+LbASwA++FzCGVF2DgVH/DWnjlQFHchwdIcproPHqtIFasfVmYej7wlFSp+EL0nSqGnZXTKL6OAMuOH0PJPd0FQmV9thfv7OEKh9P7PV5QPvkccgff0vv7pHOeGSac43U0/RpnbijSzjvCPfYTOe0uK2DtI1ngBHzlKIi+QhEW3BXee3H63f7c2Z93WkSJRjJoX4TSjZwU3HAqeJwO1y3zFErChO/lToVytpCsuBOWaft0gLSWIuOovuyElosmVubWYQHUNFQ63nz26R1SzEn81PomJaLfjq3sgnJTwP4VDUWr7/+957AvxgK0t89H5dXuRHrA0Wa7/MsmuvPFKn/V67SZHz1/xDKI1c99BdafTZKbSv0ylz3p6+F7w4UYyleYaE8++q1VaydfRAWG6oKh8yl9tp7/6lJKKJjea4gpP5J3lq87PVu+WrmZUQp56TqeMhQIy2+cZpv97tLJikDLJVd3QQTiH5n0gKC8kZ7lxVFQrdZO5XPVt5CWgdxji1FRygxdg4vBw5KIsqW+H2aJAckboHP0HsgyDiRtruR8OlG76ULAYd0Lo1WzD6i1S3sYtuaF8oOCNSY0Uxa8ybHpnJR4k3luV1WrWpZvNKJ2jaQxIZUc3DnFk6jiWfqhuXMD637JQI5pLnEUM26jwB0wPEoc2QGQhERK0B2QIzhsmRnD2DytDjdKLb/iX70YWUteR2TaLQnmyXsqYQlo82goRdjz+5yFAjDD3lKuAYGJEOoO/7EFclP1Jm2KfIGsdwrudZ+826lcWZU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WY3K4R0brk0gD1GtpXN/rNNiXO0Me13RcOorl9gQL1U1MtImZ0f726Hxs7rR?=
 =?us-ascii?Q?EwQsVzpE5OQG+TLc0qbeEy4F5EvCBvrIUcvXeBQBTFN6JcUxTRZgKbcHfw8d?=
 =?us-ascii?Q?4dhxj2f45nLbKC81I+MoALVf1iFen3rANjvmc2eUmsAko046JlNCB5bm+a3q?=
 =?us-ascii?Q?4mdVxo47nIjCKOgmhf8UOpYaPmXRDuyQWhYK49SYsxSlOOPZ7vjJz/6iksAZ?=
 =?us-ascii?Q?ey1p0Vkrfppz7r4Ipe0jkX7juRtoNCNh+Onc/8F/OxBM3kFCKXmFy7JYfiyP?=
 =?us-ascii?Q?CYo6tBpLOvQ3S0tEMLniTW4BKGzIZmmI76T+zQ2uSmRya1pu2vQp/N2zYVOx?=
 =?us-ascii?Q?pn5/qw0bjN0KtyD967e229N2ZNNe9HBzdXulNapNDgg9K7r46DPiyAGh+ALQ?=
 =?us-ascii?Q?ME/gJa3PL/Cjc9qGCx5KgRsp7ChQnZE07qAf4QvxF4gCXHOQlIDRvBrrxySH?=
 =?us-ascii?Q?wxoopCvrpis1u5GRjFcqbZtFRSIAbMXaTrS6qH+e15RarT6zlp0O5wzhORDL?=
 =?us-ascii?Q?C4tawzzZ/i1Xs66QETy94PSKuXfld9NHxjiyKlT9tOTaVYhHKbWFZPqP4yxf?=
 =?us-ascii?Q?W/1ngD2HGMsEQSsqV19wIz1NNHT++R7Vy4yKI9SLxXoeHKvtXA6Bjo4X9W/6?=
 =?us-ascii?Q?kuXrPSPpVhq3OxnDgsO+McVeEyKnnq58GUwa06FcevdNWWgiz1367TXO+T9+?=
 =?us-ascii?Q?A7vm8JbrJp7eua7m39dV7tzC+4z1IjyLw6fwqqtAmGyiQOZpAYECD7U7O+h2?=
 =?us-ascii?Q?GMykvAJ+8vYmXo8y4fqru9d0ylrUvTSNQPYIQQBQ/cUBglGLzLfzXVnj6DZg?=
 =?us-ascii?Q?+oY5sL2Nsx5xgZs2c9PBb5+RqnB9D0W4AOb7Ugz4mfKj54Ltg0DRa90g6R2t?=
 =?us-ascii?Q?pW961n6qwQROQINHyycsSt2T32Jrn+NZzf+Sar3UaufGlZH5rLxklcf+20f1?=
 =?us-ascii?Q?WQMOv++ws8q+h1ZnjRqqMyTl3FnU4RZ9BM2BQby/q7qFg3bLEGOUqO0TlAl7?=
 =?us-ascii?Q?H001v1oxFRSRAHEJjQG5i4R686ZGC4auKpfFZHazPP1rynx6HnJu/15mnFbF?=
 =?us-ascii?Q?o7h0YVnYLv/85rMi7knAS592qRT4Ex5MzEdifrGTakTYvDASvnOuEDo2qUfx?=
 =?us-ascii?Q?9bTNcjpANk+X98w4rqpOG9BCUtxqgxkPe3dDjgPmJ46WT6BRMEopj1C3FxYD?=
 =?us-ascii?Q?5vE0nrKTPvjOYgPTpiTYbGdghjtsV7F7qfAOQjbwVLFwE3M+cBpiDyExSHsB?=
 =?us-ascii?Q?12Ut7ZXrMtuIyvv7GPxZa8FOKajnnXs5A7xBHM/uyEPl2jJPy6Epb8HR9w+v?=
 =?us-ascii?Q?2qETEZoXaLKLSSuhxvRaHvjzVor3EtWpuJiWrEFQt/+N7a8ZWT93+2UuYDXq?=
 =?us-ascii?Q?JYdDwvCjg1554J8+sb4U9mbhJBBev7F0FnB4E1YG+3u9fsUsdKbplm+wWoWz?=
 =?us-ascii?Q?3myPF973BkoqtBiDPAqTYeVB/xuZcAjXAQmQNDeyPj7HZg3aIfG6M39HmZTD?=
 =?us-ascii?Q?aVreKBTKLGlcGfZtpYKJ5OlIV/FNPdZibJ/blkXeesjPoAG4nrXNaiw0HBtF?=
 =?us-ascii?Q?2341rD8Ee87SeoMMHCzDrX7zfQsq5xc03O2p7b+ojRq4BDoOeKKaOuVXieOj?=
 =?us-ascii?Q?gJ4ei/J2q8xFPyNJAUCQLfviD1YjkmRlNqEf/6RtjPi3pdOH7Bx6/HnGf6mp?=
 =?us-ascii?Q?8EMhYh2DUW4/XHaZSTDw8VgLpLeJPrLvx/Q0fMMhuNKKmC4s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6013283f-76a0-49c0-99b8-08dea1b9460d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 04:23:44.9033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3m2HPJsPmpzncb/Ccvpuh37qKMNxF8+OhcQ79HNlbjO3BSzpW0on4qCay4nSi4tUdq4YhgT4txnFDwDawSuRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_212349_783843_C06DEC56 
X-CRM114-Status: GOOD (  20.15  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Ronak Jain <ronak.jain@amd.com>
> Sent: Wednesday, April 8, 2026 4:43 AM
> To: Simek, Michal <michal.simek@amd.com>; Thangaraj, Senthil Nathan
> <SenthilNathan.Thangaraj@amd.com>
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; J=
ain,
> Ronak <ronak.jain@amd.com>
> Subject: [PATCH 1/2] Documentation: ABI: add sysfs interface for ZynqMP C=
SU
> registers
>
> Document the new sysfs interface that exposes Configuration Security Unit
> (CSU) registers through the zynqmp-firmware driver.
>
> The interface is available under:
>
>   /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/
>
> The CSU registers are discovered at boot time using the PM_QUERY_DATA
> firmware API. The following registers are currently supported:
>
>   - multiboot     (CSU_MULTI_BOOT)
>   - idcode        (CSU_IDCODE, read-only)
>   - pcap-status   (CSU_PCAP_STATUS, read-only)
>
> Read operations use the existing IOCTL_READ_REG firmware interface, while
> write operations use IOCTL_MASK_WRITE_REG.
>
> Access control is enforced by the firmware. Write attempts to read-only r=
egisters
> are rejected by firmware even though the sysfs file permissions allow wri=
tes.
>
> Document the ABI entry accordingly.
>
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
>  .../ABI/stable/sysfs-driver-firmware-zynqmp   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> index c3fec3c835af..f537f7d9bb55 100644
> --- a/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> +++ b/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> @@ -254,3 +254,36 @@ Description:
>               The expected result is 500.
>
>  Users:               Xilinx
> +
> +What:                /sys/devices/platform/firmware\:zynqmp-
> firmware/csu_registers/*
> +Date:                March 2026

Should we need to change the month to April ?

> +KernelVersion:       7.1
> +Contact:     "Ronak Jain" <ronak.jain@amd.com>
> +Description:
> +             Read/Write CSU (Configuration Security Unit) registers.
> +
> +             This interface provides dynamic access to CSU registers tha=
t are
> +             discovered from the firmware at boot time using PM_QUERY_DA=
TA
> API.
> +
> +             The supported registers are:
> +
> +             - multiboot: CSU_MULTI_BOOT register
> +             - idcode: CSU_IDCODE register (read-only)
> +             - pcap-status: CSU_PCAP_STATUS register (read-only)
> +
> +             Read operations use the existing IOCTL_READ_REG API.
> +             Write operations use the existing IOCTL_MASK_WRITE_REG API.
> +
> +             The firmware enforces access control - read-only registers =
will reject
> +             write attempts even though the sysfs permissions show write=
 access.
> +
> +             Usage for reading::
> +
> +                 # cat /sys/devices/platform/firmware\:zynqmp-
> firmware/csu_registers/multiboot
> +                 # cat
> +/sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/idcode
> +
> +             Usage for writing (mask and value are in hexadecimal)::
> +
> +                 # echo 0xFFFFFFF 0x0 >
> +/sys/devices/platform/firmware\:zynqmp-firmware/csu_registers/multiboot
> +
> +Users:               Xilinx/AMD
> --
> 2.34.1

Thanks,
Senthil

