Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E33FD5335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP+DTHLWaw6MIg7Qe/N/zVKHMhdCR/od4PiNtX6zxsg=; b=vR2U8eYIbEnaBKQMx4ifm20tkk
	i82u6VL+8LpXQMlaY1/r7qA+G38EMsm77eiipeMg7OH3Jxo8LjBQd3f1UXrymBttoJin6ED6iDcYN
	/A8PTdp7MNJC8K/aLiS7QFigJNdgiud7R/e+1Klnl+qiYR0SC/gqw2lKCKLkwUWum3gXsrxeS7tci
	LLvwgSCnTNkxcOhZ62EEEF6uWqeXIuCuD3o+cymO66r0D+VHg6eueLghfIE7iAsFQeElL2n5OCCKL
	y9UfkJhkrGVGFpcPcrq/q7Ig/w6EtsgVK/Ot4h9BdfiT/Wdtw75xlUBmRp4FUsJdJnrpX8TmOe3cb
	lc1poDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvupI-00000008DAB-3vAi;
	Fri, 27 Feb 2026 10:12:04 +0000
Received: from mail-northeuropeazon11010054.outbound.protection.outlook.com ([52.101.84.54] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvupF-00000008D9o-485k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:12:04 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MMeaIkeKn/QON8MUlzfEtS5cm07TuuDfAmKkJTIxATbZHqICKzY5gsasoba3IXi28k4GRxHaVPSz6HhPJPBJoPRWsLTemg304bQmdGcrQxiNbuvIAikuWOPUZDkmQ5S9GlqLiNzuQfW+DJ+PxTk/RlRAz/dwr6fmtn44ExVfx0sn41h/NLtx2yFVmLfyGj8g9roDi5vz8H3P3CcKldVQ2K5tGUtR8JbmLNE17eX9moPak6Z6y/zUuQCBA0HrvNlWR01WRuic0901LsxlZzFwNwQiwSaCH6Rdr/Yi2uElFLfaM1HrBG7Lb7APkAnC0we9wt4d+JNG3FmsWSDyr7Zdog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP+DTHLWaw6MIg7Qe/N/zVKHMhdCR/od4PiNtX6zxsg=;
 b=ZY73GGj+BdGQ4SyaIIv9MGb6vqE5oZQdRvU68WEp+J1Ge217LLCzvNzxMolxtvsK/+lxzvPmdVKIlg9eJvDDN3STtHON8U4/vNuMUYq0F+bTHqatpfhbdaJwYN2t6i9c5Srjg4lH0sLHl0ftyU7DL6TsFybCp3lfpPh4q2l471xioo7/6MCs7UPxsehpzoXqhPOZ2aaOPwkTkf1SIxZawNMUyunxintquRwA9k/+TOlWq+ijLHZUVgkDkPEHz206npzb8918KjGEB/rAH7TGq3uGnVOpN2W36f9Pw/jrJxB+/RThXJdybbEd+EvGcQzIVQUJsb9rTnD3pAXyGJgt7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP+DTHLWaw6MIg7Qe/N/zVKHMhdCR/od4PiNtX6zxsg=;
 b=hbqIxbhYP/g9wvVtQ5Ok2jikHGFQvPwnKmLbdbZqRN6IMe31nSrhMTwL8jl0hHPkRVCZ54LnU2MqAtIYoQoMBkJIU5yZu0Co5iaMYO/nN+NOp8ySNLRL0eoM2MPfVq6NGge/H7zADURCVpRkKDAYQdjSj0sNnYjG66xm53grxcM=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by GVXPR08MB11610.eurprd08.prod.outlook.com (2603:10a6:150:326::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 10:11:54 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::fb) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Fri,
 27 Feb 2026 10:11:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Fri, 27 Feb 2026 10:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBKp7aLTXDfVEOr9DqTuYOfVNsUe9e2Y568BeHelo8cvZbkyIWVncEzsl0E+6ks8P/4m4VJzjBdgFNCJbo2BcHPJ5SK6SrMEA9ICFCu9KWgPckwL6GFAjkqaioLIv4nfhBcAmkn5xhFGbKsNJ3Z+FdnFqTsHwj3o23A8IANx3FKo8/+ByEO7HmkUgiZR2j/00ZIN0jOphs1cSlNo88y8Ebn1ii4n/mtcGWpkx9JeJPmpWzPVQOISUgWM0Uyci200tzsFOx63sy5mH3K9TmHZkgIcaTPAxFyqc7SYiAsvUezVxwAW80ZqPs3yituitaClZUbGe2dhXEBVj7NJVXsR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP+DTHLWaw6MIg7Qe/N/zVKHMhdCR/od4PiNtX6zxsg=;
 b=HqPWr/I+D6w/JxyffeqjyE7t0vfcKhF75YjRmjCDmGVijrxX9ZQSbI5BTwslp3+czja+17INs+2eFc/5F0dRoPvdKdy9tlUYWSlQQZ2K3O+tmA/KE+o3lweDkRntewLzUCH35EAZIgKpb/bvwMkpJcYevW4p+HR1RYCuqxUoaWr3guyVwPoLPsH4tuwMxVi1oWsuM514ntTUm0f2qPXKxDzrgNhOi9qqiJkVSJthNWtTwgryFMohLDUPIlxTOCyB8/XyLraCUemtxMgkpWEYL48VY7/rvvCK3yDUKJMuSgczLyHuNUgbsGM7o0GR+uQREy0Ne+SZ468USaVKuimGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP+DTHLWaw6MIg7Qe/N/zVKHMhdCR/od4PiNtX6zxsg=;
 b=hbqIxbhYP/g9wvVtQ5Ok2jikHGFQvPwnKmLbdbZqRN6IMe31nSrhMTwL8jl0hHPkRVCZ54LnU2MqAtIYoQoMBkJIU5yZu0Co5iaMYO/nN+NOp8ySNLRL0eoM2MPfVq6NGge/H7zADURCVpRkKDAYQdjSj0sNnYjG66xm53grxcM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 10:10:51 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%6]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 10:10:51 +0000
Message-ID: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Date: Fri, 27 Feb 2026 10:10:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::30) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DB8PR08MB5500:EE_|DU2PEPF0001E9BF:EE_|GVXPR08MB11610:EE_
X-MS-Office365-Filtering-Correlation-Id: a24ce416-ed0e-43b8-b22d-08de75e8a1c3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: jxb/HENPaU+Bgwm3d/l9gzKmHZTbAk79oFveWXZH+fxOmJbS+AX8zaNuC6IIMLpE7PEThI7HXVojW0pe7vsgq3duJUHf5lLASPnw5CtrPkshlTxTn12CF/ej5DlPBGkUk+eK6tpmcs3RhobIiqcgr6+4ekGUQlOAlWN/83C5baX/GfwfKbUGhWyVLtjOmZxqRlVVxVuNHDKrCUkchTzj8eeDkdoxx6yBy7zLWbtqT+T1hF731TXC9Tu0IDw71PmzZ0uJRDGIVIwX4JUtn08U/6W0bm5TvcSlkq6KOk5rZU3Pk2CH5EYLlXi3TrZf2k6s6dONFOAj1YlKbTyJt1RyaY5bvVUN96sOBGSgrdctlmFAEnVDto0sFA7O/6HvRcE+FrUmEDbqLwGDiBWJ8twuTu4BsUeIlh09CS0GU2EBAwH63IsJruU3rXpAH05BNER7yzMiXZ7AZl1ToEDFq3gjFKaW7m673jH36mNrER4Yu8FW5i2kz7LRCyGYSD/KVUOe4S8J84E0HMEC0M4jvxAaE8KeIBYkY9by4CB59l1Z4ktNXZiNsFnHy2aMPCt9FBly9XElk+96QKQwLNMb6PDqo9bYC6YVlHMQQIGj0LrLQsH4AxfMDf4tjPuSd+6NfaJMj24l1U00sugunme0IRTkILgO0cFxNqoko0msIqQPzFI1htRSDGFi+i0Fz4CFwXPA
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6bb6ba83-0800-4080-0fa2-08de75e87c34
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|35042699022|82310400026|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: CszYRyjPGG79JBv+MG/5CUg+U96uwtdbrZ3DPNcTiaPXc4zlk619oBSYAfdC5s6v+i9U7nf+pmm/gtTx/1VehSrD/QUjcPbQdXvMrUi/ddHNiF/b16Ya4u8J9wWJsWTy1bo02vrGjTPcKfdjeNlY6gNYsIxghXBtUz2EtfMfkpwo8MGttbtzVK4VbxyOnbMd8h7CYSQI2crlTMRS4fRhENR4nz8iXELYm7NDWH8JhWEI8Oi7NCv4PB9HibPflqy5sQotwzpq9C3xRYVaxrE5GbaEzUKZOkz6an73HKBDZRnIiq0AZTCWzbGVkmJ7+iTjNfpp87QymczPrf7QRBtRqneW+2BpUMG/ZdbH39Aqqhr3RhZCa4RkyJ+DxUFtntGZmZbCkRtlVwwZjIwH5FZ4TsHqCMujmvQ8g7T0Gh4A08Q/iuqE/BDY/OSt69EshBzQkl22gXRHJu/2FTcOR4zWacYHMdYxaeYXBTW+l87T/FZy1WRyj1YZ5Fl99biN4bLwyEugvLbOPnwrdE+e6PbR7WCthAx5/JdNhJKZFvh653FfDuGxw6Md864r58BKPJK+OaVouRlw5MoefBSlhQ4DZfk6rVNhKHWMT6rMiTqWJiXOgMlTO4W436GlQgz1oIaI6pLXJfqG4Z3GHhnZr4RLOicKtpT11Ly0myON+7pos1qoGxRvP5zmib/fY9uXHbzcnUO3dRh4HegGhfDQ41yPFY+xT7/ryjwmwM5sReLQ2d5xPgR8X141Z/39AiZ/ttAOxY7QnKqbY/P2OMyRy3OKbfPwk5ANVNByvsJFFwbfIvk=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3/tCIvYo6GWnCJLo82FXafGFsi5EOdLO+rkC9l8rfFjTjoUDQ+FLCXEimP5qmaQ+HwP9QY4iZZbYb30cJd8E8ksXgde2uHLS5N+ljPVvjLfYbtMcCLepf4BdjROwBDE9wRgbuMy8+XZjVwN0LcvXBgJZ7Yh1Q3GsJTrovlCSIRdflrAaoA6oxAzj2TA6Cv+57BfbT51AguC4c1DdrAVCxJlVgQPF2SoICUd3RseyLPnkDcgXqsKRG4ahEA7I9f3u/p2zfBQzbwCvNYWPG3eZvKJNPPrMQgPnhBRCqUXGruvr+VInXx68Ea9TI/qZgKaw+waK/4BloX1HGyjNKpPgQuFcXS+V559cz8BSLbx/Nj4nWpWaaMecvnSSxiO1ZxSD1zh12tr+q31UcyC7h9lC00k4qrFH46dVZMPy4a2Me3VyWLege7buO6GRyHmzvMXN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:11:53.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a24ce416-ed0e-43b8-b22d-08de75e8a1c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_021202_112413_F5E39A52 
X-CRM114-Status: GOOD (  15.44  )
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

Hello,


On 04/02/2026 02:22, Jie Gan wrote:
> The DT‑binding patch adds platform‑specific compatibles for the
> CTCU device, and the following Qualcomm platforms are included:
> Kaanapali
> Pakala(sm8750)
> Hamoa(x1e80100)
> Glymur

Given this is predominantly DTS changes, and there is very low chances
of a conflict with the binding yaml change, I would recommend this to go
via soc or the qcom platform tree.

For the series:

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> 
> Since the base Coresight DT patches for the Kaanapali and Glymur
> platforms have not yet been applied, I created DT patches only
> for the Pakala and Hamoa platforms. I will submit the Kaanapali
> and Glymur patches once their corresponding base Coresight DT patches
> are merged.
> 
> The Hamoa‑related patches were posted in a separate email, and I
> have included them in the current patch series.
> 
> Link to the previous Hamoa patch series:
> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v3:
> - change back to the numeric compatible from hamoa to x1e80100.
> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com
> 
> Changes in v2:
> - change back to the numeric compatible from pakala to sm8750.
> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com
> 
> ---
> Jie Gan (3):
>        dt-binding: document QCOM platforms for CTCU device
>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
>   3 files changed, 340 insertions(+), 1 deletion(-)
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
> 
> Best regards,


