Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF91C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOVhWSYXpg3rFDB9j05cVBFKeIDiyGiLgGEaHihLK1A=; b=uGSb9KY95NswufaJpz9/FiNc/2
	ihBE98q1U5WvblqDjWMujGNScIO/zovJ6lmXS8EXBABBIbWpN7MtNkcQyvu/QlGxnNUrDQPvq1svJ
	Ix7vv7yB3Cs9auJl0VrPxyX5f/zYD99HGChBfkoGJY67ofxxStDJwJqNeakXArbNFCHqQkcSomtn0
	/H1LKEn9J6KWqHqTKcsO8h/RUyQorF7imOUqcoz0BvrV0hRSpulOmxiVVFuWsilkTFT8gjKFFCpYP
	s/goLqvGIz5/vu1dlIZAyOeDsqzkD+n8t4XdO8flfSovxsDodn3h7iR+MQVW9oii/FAUPzA+UOp6O
	JSNRjbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Zm-00000004aNz-384r;
	Fri, 10 Jul 2026 09:31:18 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Zj-00000004aMx-03N9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeF+A7LkCWGiPXK1e59dpUosBC3Zo3jShDfqq9KJc6OR8WMkcVddlI6hJEo0YDRZe6u24PbCSUbQXWVB28ZYKOSkLYcZBqThIcyfnoosJAvIX+HhQoRHXtkv5eIjsjemmTmSbp9ghBMkEBDEd5xBYqq9kUBvgWD/77fuHzmvi1qmh/R6Fp29jWthmgkXSeoPkmUf9qCOJwgOuKik2olqqrNWCKAPFDgSVf8glZCmZu+WhoI9p6JPev8srtjIpgz206+sKJ3M9rjUtnBYz3mrAxsetv/CiV2g8ysf1imoOfEHSVXb2gDo23vLsMLkOMCu4OLQcO7SKgUMczapQhZUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOVhWSYXpg3rFDB9j05cVBFKeIDiyGiLgGEaHihLK1A=;
 b=BQoRbSLLVkIb/pYZorNphjomzhNpPXDI3fZpTav6aYA1dLlyROvPH/CtySnr6QBKc2oZJiyEyRd3wUHCIpT9EEL8WT1GHA/7pQu4XOdLC/wVl6HKmGG6AuBPl1T08J1FcNDUgCgIEnCKPs3c1VWVAJncix6PSPn/ro6MmIQcGyyzRCr4s+B0SEpRz4mNCYTnCsDiQqrHZ8i9ewftsYLQqI7FxiXcRTTwIcqF/xPM3hEm/5JWhOTzRghX2cnhdPC32VqttxyywArm/pLuK43TDT5zT8UNaKIQcGLvwK6HiP+m1T0w24krQfAFelJBGOCIkc6GHJhu3iq430lcJag+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOVhWSYXpg3rFDB9j05cVBFKeIDiyGiLgGEaHihLK1A=;
 b=ny12chbKzIRTjqFPbm8/EFXUmLpdMvAasNGnU8VIoKiHMVWVXmA6Pc1EMAuqCNJtUH6SSNAmQ2CKYJTzywacd+ByQLvNusRLUk8eQT3wXdPL9odNBSMRos/YJGQ62DSjs0lD5jJigoBOWFY07MVTFxPkrgr8QSwZyduNfa2kkABA4My+yLxKVeOUNMaOmYuX9DZibpNFY1qDl10Eb5AWFn4ZdtTDijHAkF4fh+Czn1b1YYdwJ5PFhN3bDquPbX6uUP88DXX+8OcICoXhkeKXiycT3YTBCvD9Lp+BabGX/lldf8T4nygIvXALZgp9hTrW3xX9FEt5dgjIedpni1FMgw==
Received: from MN0PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:52c::6)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 09:30:59 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::50) by MN0PR05CA0001.outlook.office365.com
 (2603:10b6:208:52c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.6 via Frontend Transport; Fri, 10
 Jul 2026 09:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 09:30:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 02:30:34 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Jul 2026 02:30:33 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 2/8] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Fri, 10 Jul 2026 02:30:14 -0700
Message-ID: <20260710093016.2708799-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-3-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com> <20260706134455.132091-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: b22be619-47ce-497a-6a9a-08dede65f380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|6133799003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: /3GFCQwVK195qvLVJSY0p2j+XUITrj9njXIxjNeoniXR0POkkzY+HwbTxsr8/OORLP8DWog4CpitGwiPRk5QptUOsTBlMXwTrDC22LZUwC/HSV4R0f3kEDr+4pZAm+TmSBdY/dHF8TBkBRaNA8h04Q32OPvt2LRytVsIK5c2Ui7R+mVckAu1YOij6Q/FlRjq6nNG2J5fMs2BXDT0GXbHKYj2q75YhGoMscDrBCTabBoVeLQyGPizcYlANbo/8QdI/kmteG+QlyWDYXI0B8WcOYu4nwx6d9TZH0q6viNwJxMwWAo9hm2YmcvVuHeBcrTP3EHTL7InQlTXKoZUS2U+lLWLD80MLA8B2uTexAbjQJFzKVELrKt0fNvJfN7eYsdNx8Uu0E/eYNY79L7xBKGqWUmAzP16MfphmiQSNxvdf6OuOa9uA1FI6G11vves9U7l6uQXEmZ0lY1m+d3+5HhTF2xKVogBbSFpVjZGiidlBJOK/F78lw2h0MA1EHkt4XIKGkoccBmKULumKv7C6EAf081Z2PmKNNm+yHKSCWK4i2Tk5/CfWyg4/weQM6iQtfGi1chmYsjNodbB7ReOSu7aOcmUhEFgqIjPtmJ74o2zrTppUlfrG2sJaUnwSvEExUYOIxJ5D9lkH1IlUSRu7KktvGKNyirhWomchTMTaz1PgHxjQLh0n9wz8QwYDj9jBweRZJfX21l5oLdbxAbsPlP5cA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NPHdKax+hFp3N/LnKjDB/FlHG3cww9mZcTQFwGcXBjJGeOI7VAOGQQkp1cgqYcacrMKDCS1YR6OKN/eAQTIg43BbyZY2+YD8kdCvd97B02QhaA6757PnUAYal1DGCsSD0v7ax7hWf+cgLUcBMIVbb+0ODpM/7B5J7A+EVe5XR2/oTzOsAR0iGXOLgIpcpLEf2HCTPtC2TSJi5VZfoUjp8OjE5mZ5USaTXK8ka4fU5wgk894nqHrgQgEbxNubNWR559UTJALAwzRm8b+9ej7CTQo4meWmEYQchG57D220X9ZRPjlqJmfkj9vvS5gnWHsLZhSMA5jq3W3Aq4y8ljqeOG1RGwvthozNaSDnCC/bOSMQWWsevZP/vvo9eXbUtX+hz4Y3hg9HfX3F4Su0mO32hfGNTADRJVXHeC8u1ShAoJJkA9T2df3sjk2E2thMQero
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 09:30:58.9662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b22be619-47ce-497a-6a9a-08dede65f380
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_023115_164687_37C27A4C 
X-CRM114-Status: GOOD (  20.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2026 15:44:42 +0200, Andre Przywara wrote:=0D
=0D
Hi Andre,=0D
=0D
> From: Salman Nabi <salman.nabi@arm.com>=0D
>=0D
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe=
=0D
> activating firmware components without a reboot. Those components=0D
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the=0D
> usual way: via fwupd, FF-A or other secure storage methods, or via some=0D
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,=
=0D
> at system runtime, without requiring a reboot.=0D
> The specification covers the SMCCC interface to list and query available=
=0D
> components and eventually trigger the activation.=0D
>=0D
> Add a new directory under /sys/firmware to present firmware components=0D
> capable of live activation. Each of them is a directory under lfa/,=0D
> and is identified via its GUID. The activation will be triggered by echoi=
ng=0D
> "1" into the "activate" file:=0D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
> /sys/firmware/lfa # ls -l . 6c*=0D
> .:=0D
> total 0=0D
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cb=
bd5a00=0D
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f63=
3606d9=0D
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f2=
34b6e4=0D
>=0D
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:=0D
> total 0=0D
> --w-------    1 0        0             4096 Jan 19 11:33 activate=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capab=
le=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pendi=
ng=0D
> --w-------    1 0        0             4096 Jan 19 11:33 cancel=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version=
=0D
> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendez=
vous=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 name=0D
> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version=
=0D
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *=0D
> grep: activate: Permission denied=0D
> activation_capable:1=0D
> activation_pending:1=0D
> grep: cancel: Permission denied=0D
> cpu_rendezvous:1=0D
> current_version:0.0=0D
> force_cpu_rendezvous:1=0D
> may_reset_cpu:0=0D
> name:TF-RMM=0D
> pending_version:0.0=0D
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activat=
e=0D
> [ 2825.797871] Arm LFA: firmware activation succeeded.=0D
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #=0D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
>=0D
> [1] https://developer.arm.com/documentation/den0147/latest/=0D
>=0D
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>=0D
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>=0D
> ---=0D
>  drivers/firmware/smccc/Kconfig  |  10 +=0D
>  drivers/firmware/smccc/Makefile |   1 +=0D
>  drivers/firmware/smccc/lfa_fw.c | 725 ++++++++++++++++++++++++++++++++=0D
>  drivers/firmware/smccc/smccc.c  |   5 +=0D
>  include/linux/arm-smccc.h       |  15 +=0D
>  5 files changed, 756 insertions(+)=0D
>  create mode 100644 drivers/firmware/smccc/lfa_fw.c=0D
>=0D
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kcon=
fig=0D
> index 15e7466179a6..7fd646d515f8 100644=0D
> --- a/drivers/firmware/smccc/Kconfig=0D
> +++ b/drivers/firmware/smccc/Kconfig=0D
> @@ -23,3 +23,13 @@ config ARM_SMCCC_SOC_ID=0D
>  	help=0D
>  	  Include support for the SoC bus on the ARM SMCCC firmware based=0D
>  	  platforms providing some sysfs information about the SoC variant.=0D
> +=0D
> +config ARM_LFA=0D
> +	tristate "Arm Live Firmware activation support"=0D
> +	depends on HAVE_ARM_SMCCC_DISCOVERY && ARM64=0D
> +	default y=0D
> +	help=0D
> +	  Include support for triggering a Live Firmware Activation (LFA),=0D
> +	  which allows to upgrade certain firmware components without a reboot.=
=0D
> +	  This is described in the Arm DEN0147 specification, and relies on=0D
> +	  a firmware agent running in EL3.=0D
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Mak=
efile=0D
> index 68bbff1407b8..cddf2c460ab9 100644=0D
> --- a/drivers/firmware/smccc/Makefile=0D
> +++ b/drivers/firmware/smccc/Makefile=0D
> @@ -2,3 +2,4 @@=0D
>  #=0D
>  obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+=3D bus.o smccc.o kvm_guest.o=0D
>  obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+=3D soc_id.o=0D
> +obj-$(CONFIG_ARM_LFA) +=3D lfa_fw.o=0D
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c=0D
> new file mode 100644=0D
> index 000000000000..b333b1e28c0d=0D
> --- /dev/null=0D
> +++ b/drivers/firmware/smccc/lfa_fw.c=0D
> @@ -0,0 +1,725 @@=0D
> +// SPDX-License-Identifier: GPL-2.0-only=0D
> +/*=0D
> + * Copyright (C) 2025 Arm Limited=0D
> + */=0D
> +=0D
> +#include <linux/arm-smccc.h>=0D
> +#include <linux/arm-smccc-bus.h>=0D
> +#include <linux/array_size.h>=0D
> +#include <linux/fs.h>=0D
> +#include <linux/init.h>=0D
> +#include <linux/kobject.h>=0D
> +#include <linux/list.h>=0D
> +#include <linux/module.h>=0D
> +#include <linux/psci.h>=0D
> +#include <linux/stop_machine.h>=0D
> +#include <linux/string.h>=0D
> +#include <linux/sysfs.h>=0D
> +#include <linux/uuid.h>=0D
> +#include <linux/workqueue.h>=0D
> +=0D
> +#include <uapi/linux/psci.h>=0D
> +=0D
> +#undef pr_fmt=0D
> +#define pr_fmt(fmt) "Arm LFA: " fmt=0D
> +=0D
> +/* CALL_AGAIN flags (returned by SMC) */=0D
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)=0D
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)=0D
> +=0D
> +/* LFA return values */=0D
> +#define LFA_SUCCESS			0=0D
> +#define LFA_NOT_SUPPORTED		1=0D
> +#define LFA_BUSY			2=0D
> +#define LFA_AUTH_ERROR			3=0D
> +#define LFA_NO_MEMORY			4=0D
> +#define LFA_CRITICAL_ERROR		5=0D
> +#define LFA_DEVICE_ERROR		6=0D
> +#define LFA_WRONG_STATE			7=0D
> +#define LFA_INVALID_PARAMETERS		8=0D
> +#define LFA_COMPONENT_WRONG_STATE	9=0D
> +#define LFA_INVALID_ADDRESS		10=0D
> +#define LFA_ACTIVATION_FAILED		11=0D
> +=0D
> +/*=0D
> + * Not error codes described by the spec, but used internally when=0D
> + * PRIME/ACTIVATE calls return with the CALL_AGAIN bit set.=0D
> + */=0D
> +#define LFA_TIMED_OUT			32=0D
> +#define LFA_CALL_AGAIN			33=0D
> +=0D
> +#define LFA_ERROR_STRING(name) \=0D
> +	[name] =3D #name=0D
> +=0D
> +static const char * const lfa_error_strings[] =3D {=0D
> +	LFA_ERROR_STRING(LFA_SUCCESS),=0D
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),=0D
> +	LFA_ERROR_STRING(LFA_BUSY),=0D
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),=0D
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),=0D
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),=0D
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),=0D
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),=0D
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),=0D
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),=0D
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),=0D
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)=0D
> +};=0D
> +=0D
> +enum image_attr_names {=0D
> +	LFA_ATTR_NAME,=0D
> +	LFA_ATTR_CURRENT_VERSION,=0D
> +	LFA_ATTR_PENDING_VERSION,=0D
> +	LFA_ATTR_ACT_CAPABLE,=0D
> +	LFA_ATTR_ACT_PENDING,=0D
> +	LFA_ATTR_MAY_RESET_CPU,=0D
> +	LFA_ATTR_CPU_RENDEZVOUS,=0D
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,=0D
> +	LFA_ATTR_ACTIVATE,=0D
> +	LFA_ATTR_CANCEL,=0D
> +	LFA_ATTR_NR_IMAGES=0D
> +};=0D
> +=0D
> +struct fw_image {=0D
> +	struct kobject kobj;=0D
> +	const char *image_name;=0D
> +	int fw_seq_id;=0D
> +	u64 current_version;=0D
> +	u64 pending_version;=0D
> +	bool activation_capable;=0D
> +	bool activation_pending;=0D
> +	bool may_reset_cpu;=0D
> +	bool cpu_rendezvous;=0D
> +	bool cpu_rendezvous_forced;=0D
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];=0D
> +};=0D
> +=0D
> +static struct fw_image *kobj_to_fw_image(struct kobject *kobj)=0D
> +{=0D
> +	return container_of(kobj, struct fw_image, kobj);=0D
> +}=0D
> +=0D
> +/* A UUID split over two 64-bit registers */=0D
> +struct uuid_regs {=0D
> +	u64 uuid_lo;=0D
> +	u64 uuid_hi;=0D
> +};=0D
> +=0D
> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */=0D
> +static const struct fw_image_uuid {=0D
> +	const char *name;=0D
> +	const char *uuid;=0D
> +} fw_images_uuids[] =3D {=0D
> +	{=0D
> +		.name =3D "TF-A BL31 runtime",=0D
> +		.uuid =3D "47d4086d-4cfe-9846-9b95-2950cbbd5a00",=0D
> +	},=0D
> +	{=0D
> +		.name =3D "BL33 non-secure payload",=0D
> +		.uuid =3D "d6d0eea7-fcea-d54b-9782-9934f234b6e4",=0D
> +	},=0D
> +	{=0D
> +		.name =3D "TF-RMM",=0D
> +		.uuid =3D "6c0762a6-12f2-4b56-92cb-ba8f633606d9",=0D
> +	},=0D
> +};=0D
> +=0D
> +static struct kset *lfa_kset;=0D
> +static struct workqueue_struct *fw_images_update_wq;=0D
> +static struct work_struct fw_images_update_work;=0D
> +static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];=0D
> +=0D
> +static const struct attribute_group image_attr_group =3D {=0D
> +	.attrs =3D image_default_attrs,=0D
> +};=0D
> +=0D
> +static const struct attribute_group *image_default_groups[] =3D {=0D
> +	&image_attr_group,=0D
> +	NULL=0D
> +};=0D
> +=0D
> +static int update_fw_images_tree(void);=0D
> +=0D
> +static const char *lfa_error_string(int error)=0D
> +{=0D
> +	if (error > 0)=0D
> +		return lfa_error_strings[LFA_SUCCESS];=0D
> +=0D
> +	error =3D -error;=0D
> +	if (error < ARRAY_SIZE(lfa_error_strings))=0D
> +		return lfa_error_strings[error];=0D
> +	if (error =3D=3D -LFA_TIMED_OUT)=0D
> +		return "timed out";=0D
> +=0D
> +	return lfa_error_strings[LFA_DEVICE_ERROR];=0D
> +}=0D
> +=0D
> +static void image_release(struct kobject *kobj)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	kfree(image);=0D
> +}=0D
> +=0D
> +static const struct kobj_type image_ktype =3D {=0D
> +	.release =3D image_release,=0D
> +	.sysfs_ops =3D &kobj_sysfs_ops,=0D
> +	.default_groups =3D image_default_groups,=0D
> +};=0D
> +=0D
> +static void delete_fw_image_node(struct fw_image *image)=0D
> +{=0D
> +	kobject_del(&image->kobj);=0D
> +	kobject_put(&image->kobj);=0D
> +}=0D
> +=0D
> +static void remove_invalid_fw_images(struct work_struct *work)=0D
> +{=0D
> +	struct kobject *kobj, *tmp;=0D
> +	struct list_head images_to_delete =3D LIST_HEAD_INIT(images_to_delete);=
=0D
> +=0D
> +	/*=0D
> +	 * Remove firmware images including directories that are no longer=0D
> +	 * present in the LFA agent after updating the existing ones.=0D
> +	 * Delete list images before calling kobject_del() and kobject_put() on=
=0D
> +	 * them. Kobject_del() uses kset->list_lock itself which can cause lock=
=0D
> +	 * recursion, and kobject_put() may sleep.=0D
> +	 */=0D
> +	spin_lock(&lfa_kset->list_lock);=0D
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {=0D
> +		struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +		if (image->fw_seq_id =3D=3D -1)=0D
> +			list_move_tail(&kobj->entry, &images_to_delete);=0D
> +	}=0D
> +	spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +	/*=0D
> +	 * Now safely remove the sysfs kobjects for the deleted list items=0D
> +	 */=0D
> +	list_for_each_entry_safe(kobj, tmp, &images_to_delete, entry) {=0D
> +		struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +		delete_fw_image_node(image);=0D
> +	}=0D
> +}=0D
> +=0D
> +static void set_image_flags(struct fw_image *image, int seq_id,=0D
> +			    u32 image_flags, u64 reg_current_ver,=0D
> +			    u64 reg_pending_ver)=0D
> +{=0D
> +	image->fw_seq_id =3D seq_id;=0D
> +	image->current_version =3D reg_current_ver;=0D
> +	image->pending_version =3D reg_pending_ver;=0D
> +	image->activation_capable =3D !!(image_flags & BIT(0));=0D
> +	image->activation_pending =3D !!(image_flags & BIT(1));=0D
> +	image->may_reset_cpu =3D !!(image_flags & BIT(2));=0D
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */=0D
> +	image->cpu_rendezvous =3D !(image_flags & BIT(3));=0D
> +}=0D
> +=0D
> +static unsigned long get_nr_lfa_components(void)=0D
> +{=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_GET_INFO;=0D
> +	reg.a1 =3D 0; /* lfa_info_selector =3D 0 */=0D
> +=0D
> +	arm_smccc_1_2_invoke(&reg, &reg);=0D
> +	if (reg.a0 !=3D LFA_SUCCESS)=0D
> +		return reg.a0;=0D
> +=0D
> +	return reg.a1;=0D
> +}=0D
> +=0D
> +static const char *get_image_name(const struct fw_image *image)=0D
> +{=0D
> +	if (image->image_name && image->image_name[0] !=3D '\0')=0D
> +		return image->image_name;=0D
> +=0D
> +	return kobject_name(&image->kobj);=0D
> +}=0D
> +=0D
> +static int lfa_cancel(void *data)=0D
> +{=0D
> +	struct fw_image *image =3D data;=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_CANCEL;=0D
> +	reg.a1 =3D image->fw_seq_id;=0D
> +	arm_smccc_1_2_invoke(&reg, &reg);=0D
> +=0D
> +	/*=0D
> +	 * When firmware activation is called with "skip_cpu_rendezvous=3D1",=0D
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be=0D
> +	 * cancelled.=0D
> +	 */=0D
> +	if (reg.a0 =3D=3D LFA_SUCCESS) {=0D
> +		pr_info("Activation cancelled for image %s\n",=0D
> +			get_image_name(image));=0D
> +	} else {=0D
> +		pr_err("Activation not cancelled for image %s: %s\n",=0D
> +		       get_image_name(image), lfa_error_string(reg.a0));=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	return reg.a0;=0D
> +}=0D
> +=0D
> +/*=0D
> + * Try a single activation call. The smc_lock writer lock must be held,=
=0D
> + * and it must be called from inside stop_machine() when CPU rendezvous =
is=0D
> + * required.=0D
> + */=0D
> +static int call_lfa_activate(void *data)=0D
> +{=0D
> +	struct fw_image *image =3D data;=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 }, res;=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_ACTIVATE;=0D
> +	reg.a1 =3D image->fw_seq_id;=0D
> +	/*=0D
> +	 * As we do not support updates requiring a CPU reset (yet),=0D
> +	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and=0D
> +	 * context ID respectively.=0D
> +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,=0D
> +	 * cpu_rendezvous is dictated by each firmware component.=0D
> +	 */=0D
> +	reg.a2 =3D !(image->cpu_rendezvous_forced || image->cpu_rendezvous);=0D
> +	arm_smccc_1_2_invoke(&reg, &res);=0D
> +=0D
> +	if ((long)res.a0 < 0)=0D
> +		return (long)res.a0;=0D
> +=0D
> +	if (res.a1 & LFA_ACTIVATE_CALL_AGAIN)=0D
> +		return -LFA_CALL_AGAIN;=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int activate_fw_image(struct fw_image *image)=0D
> +{=0D
> +	int ret;=0D
> +=0D
> +retry:=0D
> +	if (image->cpu_rendezvous_forced || image->cpu_rendezvous)=0D
> +		ret =3D stop_machine(call_lfa_activate, image, cpu_online_mask);=0D
> +	else=0D
> +		ret =3D call_lfa_activate(image);=0D
=0D
Would it make sense to read the flags once and pass the value into=0D
call_lfa_activate(), as force_cpu_rendezvous_store() seems to be able=0D
to change image->cpu_rendezvous_forced at any time?=0D
> +=0D
> +	if (!ret) {=0D
> +		update_fw_images_tree();=0D
> +=0D
> +		return 0;=0D
> +	}=0D
> +=0D
> +	/* SMC returned with call_again flag set, or with LFA_BUSY */=0D
> +	if (ret =3D=3D -LFA_CALL_AGAIN || ret =3D=3D -LFA_BUSY)=0D
> +		goto retry;=0D
> +=0D
> +	lfa_cancel(image);=0D
> +=0D
> +	pr_err("LFA_ACTIVATE for image %s failed: %s\n",=0D
> +	       get_image_name(image), lfa_error_string(ret));=0D
> +=0D
> +	return ret;=0D
> +}=0D
> +=0D
> +static int prime_fw_image(struct fw_image *image)=0D
> +{=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 }, res;=0D
> +=0D
> +	if (image->may_reset_cpu) {=0D
> +		pr_err("CPU reset not supported by kernel driver\n");=0D
> +=0D
> +		return -EINVAL;=0D
> +	}=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_PRIME;=0D
> +retry:=0D
> +	/*=0D
> +	 * LFA_PRIME will return 1 in reg.a1 if the firmware priming=0D
> +	 * is still in progress. In that case LFA_PRIME will need to=0D
> +	 * be called again.=0D
> +	 * reg.a1 will become 0 once the prime process completes.=0D
> +	 */=0D
> +	reg.a1 =3D image->fw_seq_id;=0D
> +	arm_smccc_1_2_invoke(&reg, &res);=0D
> +	if ((long)res.a0 < 0) {=0D
> +		pr_err("LFA_PRIME for image %s failed: %s\n",=0D
> +		       get_image_name(image),=0D
> +		       lfa_error_string(res.a0));=0D
> +=0D
> +		return res.a0;=0D
> +	}=0D
> +=0D
> +	if (res.a1 & LFA_PRIME_CALL_AGAIN)=0D
> +		goto retry;=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *at=
tr,=0D
> +			 char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%s\n", image->image_name);=0D
nit: This should be get_image_name(image).=0D
> +}=0D
> +=0D
> +static ssize_t activation_capable_show(struct kobject *kobj,=0D
> +				       struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->activation_capable);=0D
> +}=0D
> +=0D
> +static void update_fw_image_pending(struct fw_image *image)=0D
> +{=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_GET_INVENTORY;=0D
> +	reg.a1 =3D image->fw_seq_id;=0D
> +	arm_smccc_1_2_invoke(&reg, &reg);=0D
> +=0D
> +	if (reg.a0 =3D=3D LFA_SUCCESS)=0D
> +		image->activation_pending =3D !!(reg.a3 & BIT(1));=0D
> +}=0D
> +=0D
> +static ssize_t activation_pending_show(struct kobject *kobj,=0D
> +				       struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	/*=0D
> +	 * Activation pending status can change anytime thus we need to update=
=0D
> +	 * and return its current value=0D
> +	 */=0D
> +	update_fw_image_pending(image);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->activation_pending);=0D
> +}=0D
> +=0D
> +static ssize_t may_reset_cpu_show(struct kobject *kobj,=0D
> +				  struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->may_reset_cpu);=0D
> +}=0D
> +=0D
> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,=0D
> +				   struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->cpu_rendezvous);=0D
> +}=0D
> +=0D
> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,=0D
> +					  struct kobj_attribute *attr,=0D
> +					  const char *buf, size_t count)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	int ret;=0D
> +=0D
> +	ret =3D kstrtobool(buf, &image->cpu_rendezvous_forced);=0D
> +	if (ret)=0D
> +		return ret;=0D
> +=0D
> +	return count;=0D
> +}=0D
> +=0D
> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,=0D
> +					 struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->cpu_rendezvous_forced);=0D
> +}=0D
> +=0D
> +static ssize_t current_version_show(struct kobject *kobj,=0D
> +				    struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	u32 maj, min;=0D
> +=0D
> +	maj =3D image->current_version >> 32;=0D
> +	min =3D image->current_version & 0xffffffff;=0D
> +=0D
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);=0D
> +}=0D
> +=0D
> +static ssize_t pending_version_show(struct kobject *kobj,=0D
> +				    struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> +=0D
> +	/*=0D
> +	 * Similar to activation pending, this value can change following an=0D
> +	 * update, we need to retrieve fresh info instead of stale information.=
=0D
> +	 */=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_GET_INVENTORY;=0D
> +	reg.a1 =3D image->fw_seq_id;=0D
> +	arm_smccc_1_2_invoke(&reg, &reg);=0D
> +	if (reg.a0 =3D=3D LFA_SUCCESS) {=0D
> +		if (reg.a5 !=3D 0 && image->activation_pending) {=0D
> +			u32 maj, min;=0D
> +=0D
> +			image->pending_version =3D reg.a5;=0D
> +			maj =3D reg.a5 >> 32;=0D
> +			min =3D reg.a5 & 0xffffffff;=0D
> +=0D
> +			return sysfs_emit(buf, "%u.%u\n", maj, min);=0D
> +		}=0D
> +	}=0D
> +=0D
> +	return sysfs_emit(buf, "N/A\n");=0D
> +}=0D
> +=0D
> +static ssize_t activate_store(struct kobject *kobj, struct kobj_attribut=
e *attr,=0D
> +			      const char *buf, size_t count)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	int ret;=0D
> +=0D
> +	ret =3D prime_fw_image(image);=0D
> +	if (ret)=0D
> +		return -ECANCELED;=0D
> +=0D
> +	ret =3D activate_fw_image(image);=0D
> +	if (ret)=0D
> +		return -ECANCELED;=0D
> +=0D
> +	pr_info("%s: successfully activated\n", get_image_name(image));=0D
=0D
activate_store() should validate the buf content.=0D
> +=0D
> +	return count;=0D
> +}=0D
> +=0D
> +static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute =
*attr,=0D
> +			    const char *buf, size_t count)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	int ret;=0D
> +=0D
> +	ret =3D lfa_cancel(image);=0D
> +	if (ret !=3D 0)=0D
> +		return ret;=0D
> +=0D
> +	return count;=0D
> +}=0D
> +=0D
> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] =3D {=
=0D
> +	[LFA_ATTR_NAME]			=3D __ATTR_RO(name),=0D
> +	[LFA_ATTR_CURRENT_VERSION]	=3D __ATTR_RO(current_version),=0D
> +	[LFA_ATTR_PENDING_VERSION]	=3D __ATTR_RO(pending_version),=0D
> +	[LFA_ATTR_ACT_CAPABLE]		=3D __ATTR_RO(activation_capable),=0D
> +	[LFA_ATTR_ACT_PENDING]		=3D __ATTR_RO(activation_pending),=0D
> +	[LFA_ATTR_MAY_RESET_CPU]	=3D __ATTR_RO(may_reset_cpu),=0D
> +	[LFA_ATTR_CPU_RENDEZVOUS]	=3D __ATTR_RO(cpu_rendezvous),=0D
> +	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	=3D __ATTR_RW(force_cpu_rendezvous),=0D
> +	[LFA_ATTR_ACTIVATE]		=3D __ATTR_WO(activate),=0D
> +	[LFA_ATTR_CANCEL]		=3D __ATTR_WO(cancel)=0D
> +};=0D
> +=0D
> +static void init_image_default_attrs(void)=0D
> +{=0D
> +	for (int i =3D 0; i < LFA_ATTR_NR_IMAGES; i++)=0D
> +		image_default_attrs[i] =3D &image_attrs_group[i].attr;=0D
> +	image_default_attrs[LFA_ATTR_NR_IMAGES] =3D NULL;=0D
> +}=0D
> +=0D
> +static void clean_fw_images_tree(void)=0D
> +{=0D
> +	struct kobject *kobj, *tmp;=0D
> +	struct list_head images_to_delete;=0D
> +=0D
> +	INIT_LIST_HEAD(&images_to_delete);=0D
> +=0D
> +	spin_lock(&lfa_kset->list_lock);=0D
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {=0D
> +		list_move_tail(&kobj->entry, &images_to_delete);=0D
> +	}=0D
> +	spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +	list_for_each_entry_safe(kobj, tmp, &images_to_delete, entry) {=0D
> +		struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +		delete_fw_image_node(image);=0D
> +	}=0D
> +}=0D
> +=0D
> +static int update_fw_image_node(char *fw_uuid, int seq_id,=0D
> +				u32 image_flags, u64 reg_current_ver,=0D
> +				u64 reg_pending_ver)=0D
> +{=0D
> +	const char *image_name =3D "";=0D
> +	struct fw_image *image;=0D
> +	struct kobject *kobj;=0D
> +	int i;=0D
> +=0D
> +	/*=0D
> +	 * If a fw_image is already in the images list then we just update=0D
> +	 * its flags and seq_id instead of trying to recreate it.=0D
> +	 */=0D
> +	spin_lock(&lfa_kset->list_lock);=0D
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {=0D
> +		if (!strcmp(kobject_name(kobj), fw_uuid)) {=0D
> +			struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +			set_image_flags(image, seq_id, image_flags,=0D
> +					reg_current_ver, reg_pending_ver);=0D
> +			spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +			return 0;=0D
> +		}=0D
> +	}=0D
> +	spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +	image =3D kzalloc_obj(*image);=0D
> +	if (!image)=0D
> +		return -ENOMEM;=0D
> +=0D
> +	for (i =3D 0; i < ARRAY_SIZE(fw_images_uuids); i++) {=0D
> +		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid)) {=0D
> +			image_name =3D fw_images_uuids[i].name;=0D
> +			break;=0D
> +		}=0D
> +	}=0D
> +=0D
> +	image->kobj.kset =3D lfa_kset;=0D
> +	image->image_name =3D image_name;=0D
> +	image->cpu_rendezvous_forced =3D true;=0D
> +	set_image_flags(image, seq_id, image_flags, reg_current_ver,=0D
> +			reg_pending_ver);=0D
> +	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,=0D
> +				 "%s", fw_uuid)) {=0D
> +		kobject_put(&image->kobj);=0D
> +=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int update_fw_images_tree(void)=0D
> +{=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 }, res;=0D
> +	struct uuid_regs image_uuid;=0D
> +	struct kobject *kobj;=0D
> +	char image_id_str[40];=0D
> +	int ret, num_of_components;=0D
> +=0D
> +	num_of_components =3D get_nr_lfa_components();=0D
> +	if (num_of_components <=3D 0) {=0D
> +		pr_err("Error getting number of LFA components\n");=0D
> +		return -ENODEV;=0D
> +	}=0D
> +=0D
> +	/*=0D
> +	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the=0D
> +	 * number of firmware images in the LFA agent may change after a=0D
> +	 * successful activation attempt. Negate all image flags as well.=0D
> +	 */=0D
> +	spin_lock(&lfa_kset->list_lock);=0D
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {=0D
> +		struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +		set_image_flags(image, -1, 0b1000, 0, 0);=0D
> +	}=0D
> +	spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_GET_INVENTORY;=0D
> +	for (int i =3D 0; i < num_of_components; i++) {=0D
> +		reg.a1 =3D i; /* fw_seq_id to be queried */=0D
> +		arm_smccc_1_2_invoke(&reg, &res);=0D
> +		if (res.a0 =3D=3D LFA_SUCCESS) {=0D
> +			image_uuid.uuid_lo =3D res.a1;=0D
> +			image_uuid.uuid_hi =3D res.a2;=0D
> +=0D
> +			snprintf(image_id_str, sizeof(image_id_str), "%pUb",=0D
> +				 &image_uuid);=0D
> +			ret =3D update_fw_image_node(image_id_str, i, res.a3,=0D
> +						   res.a4, res.a5);=0D
=0D
> +			if (ret)=0D
> +				return ret;=0D
> +		}=0D
> +	}=0D
> +=0D
> +	/*=0D
> +	 * Removing non-valid image directories at the end of an activation.=0D
> +	 * We can't remove the sysfs attributes while in the respective=0D
> +	 * _store() handler, so have to postpone the list removal to a=0D
> +	 * workqueue.=0D
> +	 */=0D
> +	queue_work(fw_images_update_wq, &fw_images_update_work);=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)=0D
> +{=0D
> +	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> +	int err;=0D
> +=0D
> +	reg.a0 =3D ARM_SMCCC_LFA_GET_VERSION;=0D
> +	arm_smccc_1_2_invoke(&reg, &reg);=0D
> +	if ((s32)reg.a0 =3D=3D -LFA_NOT_SUPPORTED)=0D
> +		return -ENODEV;=0D
> +=0D
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",=0D
> +		reg.a0 >> 16, reg.a0 & 0xffff);=0D
> +=0D
> +	fw_images_update_wq =3D alloc_workqueue("fw_images_update_wq",=0D
> +					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);=0D
> +	if (!fw_images_update_wq) {=0D
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");=0D
> +=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);=0D
> +=0D
> +	init_image_default_attrs();=0D
> +	lfa_kset =3D kset_create_and_add("lfa", NULL, firmware_kobj);=0D
> +	if (!lfa_kset) {=0D
> +		destroy_workqueue(fw_images_update_wq);=0D
> +=0D
> +		return -ENOMEM;=0D
> +	}=0D
> +=0D
> +	err =3D update_fw_images_tree();=0D
> +	if (err !=3D 0) {=0D
> +		kset_unregister(lfa_kset);=0D
> +		destroy_workqueue(fw_images_update_wq);=0D
> +	}=0D
> +=0D
> +	return err;=0D
> +}=0D
> +=0D
> +static void lfa_smccc_remove(struct arm_smccc_device *sdev)=0D
> +{=0D
> +	flush_workqueue(fw_images_update_wq);=0D
> +	destroy_workqueue(fw_images_update_wq);=0D
> +	clean_fw_images_tree();=0D
=0D
I think this teardown order is racy. An in-flight "activate" store is=0D
synchronized against remove() by the kobject_del() in=0D
clean_fw_images_tree() (kernfs_drain() waiting for the writer's=0D
active reference), which runs after the workqueue is already=0D
destroyed. A store that completes late - and it can block in the=0D
retry loop for a while - then does update_fw_images_tree() ->=0D
queue_work() on freed workqueue memory. Moving=0D
clean_fw_images_tree() first should make it safer.=0D
=0D
> +	kset_unregister(lfa_kset);=0D
> +}=0D
> +=0D
> +static const struct arm_smccc_device_id lfa_smccc_id_table[] =3D {=0D
> +	{ .name =3D "arm-smccc-lfa" },=0D
> +	{}=0D
> +};=0D
> +MODULE_DEVICE_TABLE(arm_smccc, lfa_smccc_id_table);=0D
> +=0D
> +static struct arm_smccc_driver smccc_lfa_driver =3D {=0D
> +	.name		=3D KBUILD_MODNAME,=0D
> +	.probe		=3D lfa_smccc_probe,=0D
> +	.remove		=3D lfa_smccc_remove,=0D
> +	.id_table	=3D lfa_smccc_id_table,=0D
> +};=0D
> +=0D
> +module_arm_smccc_driver(smccc_lfa_driver);=0D
> +=0D
> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");=0D
> +MODULE_LICENSE("GPL");=0D
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smcc=
c.c=0D
> index a47696f3a5de..6ce2d984ce9f 100644=0D
> --- a/drivers/firmware/smccc/smccc.c=0D
> +++ b/drivers/firmware/smccc/smccc.c=0D
> @@ -94,6 +94,11 @@ static const struct smccc_device_info smccc_devices[] =
__initconst =3D {=0D
>  		.requires_smc   =3D false,=0D
>  		.device_name    =3D "arm-smccc-trng",=0D
>  	},=0D
> +	{=0D
> +		.func_id        =3D ARM_SMCCC_LFA_GET_VERSION,=0D
> +		.requires_smc   =3D false,=0D
> +		.device_name    =3D "arm-smccc-lfa",=0D
> +	},=0D
>  };=0D
>  =0D
>  static bool __init smccc_probe_smccc_device(const struct smccc_device_in=
fo *smccc_dev)=0D
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h=0D
> index 4de81848fe2e..956a5af96c70 100644=0D
> --- a/include/linux/arm-smccc.h=0D
> +++ b/include/linux/arm-smccc.h=0D
> @@ -304,6 +304,21 @@=0D
>  			   ARM_SMCCC_OWNER_STANDARD,		\=0D
>  			   0x53)=0D
>  =0D
> +/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */=0D
> +#define ARM_SMCCC_LFA_FN_BASE					\=0D
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\=0D
> +			   ARM_SMCCC_SMC_64,			\=0D
> +			   ARM_SMCCC_OWNER_STANDARD,		\=0D
> +			   0x2e0)=0D
> +#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))=0D
> +#define ARM_SMCCC_LFA_GET_VERSION	ARM_SMCCC_LFA_FN(0)=0D
> +#define ARM_SMCCC_LFA_CHECK_FEATURE	ARM_SMCCC_LFA_FN(1)=0D
> +#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)=0D
> +#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)=0D
> +#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)=0D
> +#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)=0D
> +#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)=0D
> +=0D
>  /*=0D
>   * Return codes defined in ARM DEN 0070A=0D
>   * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C=0D
> -- =0D
> 2.43.0=0D
=0D
Regards,=0D
Nirmoy=0D

