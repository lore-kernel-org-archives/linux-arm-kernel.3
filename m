Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685B109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+pSEBOWSwoob4XeW6SAFjBb4nrNWdZ0qAJU9sNt0pw=; b=0UEZ10LBx2EkkvjEa1hf9q0Elq
	EIaP63Cg+ceQYbSI2aLZNdYmVJU8pjekbDBTyuJq2OqZqa1uZo7kBAX+ayD+O4YrA6xCAEnYfRXUu
	QFwGhjpX1EHHVijtoJFrVk5+cp7pkBDb2td7datQq6DI9nPuyCV/4acLnztsxaDj9p7wE2f6dqIO5
	QCW0tRBXozJYIBwHS6/4bnrZps9Mi65wuxVKJgiCmBBy2PKCisxkR009V747bnk21MMLzUBPDrOYS
	KcpBD/hYZc26jD5c0oYYD54mO/0P0wMRosO7AsEM1g4IpGpYMJku6iBN7OqWTKqS/6pdw27xFvRg4
	3EkGVOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FlT-0000000B03i-0OAu;
	Thu, 19 Mar 2026 15:58:27 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FlR-0000000B029-0Oa0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:58:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lQK0aLIIaFN18RbFxhSrbaCEoQsJEbXvDhEFmGXTpkUzu5LhZcZ+ybKYiRx85ICZtslGwLuLMR/4+AK9NUFTaj/3/Drhk2x6e0oTEZ5IeIAe6SzA+CTQJGYqFCBhFaqHkXRWpefgOKB1GLcLFCo2U/ty7L0FKhoqHqd0HVHdzIvUkGy+o+xJ7NQbjORXPr7rJ1Ol5zzmkP+dx/QMKTgAJEa/CukxgzPsZecE61XUOpiRfxKkP/TOCPe5pXBN0iYJrI61Azm2ZrvEqgsWujOV8eyvzDZ4mfFiJNQu3nW5GQ0uR759CI+M9TknFb0gKz0yG9yDmFPfsWSsOwDwbZzpZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+pSEBOWSwoob4XeW6SAFjBb4nrNWdZ0qAJU9sNt0pw=;
 b=YNzay3uVsFn+G3qSYp3FViuirsgDXJ/nYPc5LSa256oqwj2NXSVfij/36M01iSuV6r5iw7CDOA4cSNbQtu1PXpV8rWFPwqrwyZ8xGLnalyJ2JmOy5+L8lEQVgJNNspzc/XMD4xVhC1DWlFrjEfEGO4Aoi6ntiN0Z0m78cfLBzicRLalAN4Ah7a6d2XXyFg6gTIOr/SafZAVZzGNTX9QYRlzRUserjUsOxOGy6tAl+7ztXsRp07uvZw08HfGNviTFFtGkFXuYQGxfKkWF4FAMqOq5gC4Dmdix9Nw7Jp82vZ+WJW2xafyOfae8l6h3uXbC+thKRgTpmYiGLzqbWcFDBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+pSEBOWSwoob4XeW6SAFjBb4nrNWdZ0qAJU9sNt0pw=;
 b=PvY6alUObZU7tErROE7JlL7xl5oRPrrBD92uzSZAPRE4XHyr5brw4+EPnWfwGSqZRUWQskxMpmRXnqlNsbKbmGPytMSSDRonxrm3VP6x2RjIKu7UQrgFyxIlTwieKDJA3o8LyZyOpkGxHqfs5GDaWURy5By9ZOzoiiEGO0a/Nrg=
Received: from DU2PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:10:3b::19)
 by AS8PR08MB8611.eurprd08.prod.outlook.com (2603:10a6:20b:563::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 15:58:18 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::80) by DU2PR04CA0014.outlook.office365.com
 (2603:10a6:10:3b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 15:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Thu, 19 Mar 2026 15:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xurz90Krq7fL9GamkSSbBBQMmjSG7CXM8co4VBb+X1iPwOHa7tbptjvWXXfYkLL/mArE4E9iA1fsoiCdLttLZHPjTW44b5qM/v0oDd6lTy15YSyBXVbF2CdGZ6uKOH4ESP812VawjV6AIqh8M12BPA29s8IWB0bhQIKvo4euitcMkDHW4F8jkHpf5jQ50SxCDDUFRIvceefA1dGH7gM+H6UL/KQbJ2y6wxyBzuVDdK1mGMSSod9GayhtMnYa1DEgueIsVWFFDHEaIkEXD8wAqc91zfOAb3KtoMR6hcQ1ezrp2h2PcfDIivQRddpxxzdAMHzLENFD1FX9cfKUKm7kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+pSEBOWSwoob4XeW6SAFjBb4nrNWdZ0qAJU9sNt0pw=;
 b=FFhhPacmu7ZdpMW7ejA5E7gowq0YDhFkogceKPthJmcsOdthu9zs/q+Iep4aKndL5yKGiyvBUqLRjw3hHub58rGWY7LcVdlKg+Yyk/if6H8gNq+S2pmAWw31I0WQSk0PxQUf+y1c0n1vYZQ7DjCLGKE+AzbMcv2QGtyWGBob4Zdobc50ArO2msKYal7UxrZWqj18YzjTfEwV4K8Rg9TDEMY38WPVP1Rd4U4ooRY7J/LQv8zltYo/I4Oy/UKkNEAi4jDJZ0vjisiA8ZiIOfQO7x3Xw88+oGbKf3/T76ezp8Qzng1iKZN4XiSQt8HY/uTw2pSKYGsM6m+lpCsLnKQWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+pSEBOWSwoob4XeW6SAFjBb4nrNWdZ0qAJU9sNt0pw=;
 b=PvY6alUObZU7tErROE7JlL7xl5oRPrrBD92uzSZAPRE4XHyr5brw4+EPnWfwGSqZRUWQskxMpmRXnqlNsbKbmGPytMSSDRonxrm3VP6x2RjIKu7UQrgFyxIlTwieKDJA3o8LyZyOpkGxHqfs5GDaWURy5By9ZOzoiiEGO0a/Nrg=
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:504::10)
 by DU0PR08MB8345.eurprd08.prod.outlook.com (2603:10a6:10:40b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 15:57:15 +0000
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27]) by AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 15:57:15 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v7 29/41] KVM: arm64: gic-v5: Initialise ID and priority bits
 when resetting vcpu
Thread-Topic: [PATCH v7 29/41] KVM: arm64: gic-v5: Initialise ID and priority
 bits when resetting vcpu
Thread-Index: AQHct7kO9wIMAoLbyEu5Z8oQ9dzKbA==
Date: Thu, 19 Mar 2026 15:57:14 +0000
Message-ID: <20260319154937.3619520-30-sascha.bischoff@arm.com>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
In-Reply-To: <20260319154937.3619520-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS4PR08MB8241:EE_|DU0PR08MB8345:EE_|DB5PEPF00014B92:EE_|AS8PR08MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd10ebe-d92c-44a0-2e4a-08de85d05679
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: R5auMjcvq0lbQP+KggY7CI07M26Omdofr+ePC4WvYH46Gnjpe9FTyq4FFtrEkwLCm5dXdEKh+3OL9Z39BaIkPgmr91lX07LZahv/Q+aK/8V7Wdx3qaUkrWr7V5A5BmnaEIFsDRRUkIvwegBjosBxqCftwXRSMzLe/23ach+cG+nZx6g+CllWfxqxsuIWpHkiS77IMoUQsH1DKb8V5/v4qcbXHpr9RZPtDKKtUZyTIZLBHnh/ur4cckDA6aCO6yl8uy9TqgMFbMdQzTnSwAE+J/ymGfMN49bgs1/NfgJFGBulkwSBOnkkJZy9WEWxbJguPblXPFsCfuTxMIVuH0XbTKumKtPwpbcY70ZYAkKzC7aprDsJX6dIGPNbxPNd0XxMPh0igAJ+qVuzKe6MRpMFVnBsWSjzfni/5Q9MOILP/HsfJCjwpK/y/Ny80xKFGYcnD1pa4M3SfiDURQ1va78iXSGHPO1DClcjYw+N813pBHyH8aKC1Zd7HHv2lH7lUuNZ3QWw+uqOWitM0Aoxjn7d4nq7ANsNJVupTyyfxN5aAz7Q78W79ZwaXhtH5Y/zuP//qL7Oji4RTU5ZeILXBnmaAqDqC4ivJjfaPFSWEAP8NITTKkWndiyusw4G2kIXcPfH2sNxlMhnKEzjbrR3T/RBIfMscpeM9IcAvxFt6Ssscs6USNHvJOH2cySJyjcmj8oEhpue1Sadwq04XqESyFwOU2RQdxbvEP4n957HFZOrm5uCbLhWCLP4b3kqsKQsSAErkRzbaM4TQ/tKGWfK5E+TqppMCGUPpHAuPbr+sln7PdA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB8241.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u3mop5Vfj+x56NPe1Dv3soQte/Y9INaJaax4LdfK9bihQfkJ6LHkJIyXpsaLFTmFVM7150fpGbXr3CHpL/n6Ao5YgxubdLMtjSsviuL3zy1XIWzpEJiGWNLVkOwjyjbpUAeWc0pHXcZLPzBh3kSBmlRWX/Y8SR6u/gKfcdKz77NhL0yUkyl+EP4XtApGD9EbNjxCiy+/ovXRECckNDDa4WARx+xvuBpMaV+WPGhkJFI31NcPPYJxslH8yFABuGaffjt6NmWkkrNZwYIncT6KzeDTqDpokey0io20x4Qcxt6RbU7M5sBqoeJHIOL+Wz1Avn693TjlMaEO+PRC/GoPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8345
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ef2000b8-1bb3-46c2-12ae-08de85d030b6
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|35042699022|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: jbxuQPokvUJ04QwjEI4HpksXLHfh7+FRTgrwJ0pXn/RgyXJ1+7PybmdKnuRttL52L+7R7IVtKVy6UGrKU85DlobFH3nkOKEZUV9uEg0ipB4vuZIm5Gr5nJWl75+aJpFC8U3j26pW9ynA/0NraJdcwjBBhR3h/An/jmn0jjrYwT6FjSoxLBPGG2SnWbFSJvpj7uSu3YwytXIZiQrr0pP+2wbgp47exT2uVO4hNhjZziHESXgramRAjejTAe6jmLxzsdi/EThZYyivNV4NQJD0qRmhQZBAETWzadT5coX/jmG7dxJ+N0tznFBj+xKkZvjlIXCEIPbEulXAMOCpIqM7Ww7QxBOB/oo9bk/8jVlep322dM8ITHQnQVwvGqT4NiPANDyBKT8u+Ycy1XLF3+yWhUOPvjf9vMgND/AZnYwlsYfG2lY19Rd1dCEDQXYxvyrYKKSQEHHp8BwR4ol62nfaTRCidxT7xMLpAGvnJUCxZY2NUYQuzl9p6nFwUgTYVyJfYiYQcN7TPvrNkcc3wnbXk1QWP4mappBn8bWT2CBitf7vWrsH31kuNlqky/vyta78Kj+g7HXdpT3yUyOnxxqesAAL1uWeNI8+PAiGwKq4Y3os0fVGZ+SOTuUBpcOjw0Z5jvGHBXNQRv1dg3SCOR8piN6qFiYxGJyBY0eJ/h+eXINxswPThNdGrX2leLLcwSQtPl7IknI942REtr+DanmAJodwYM3OHdIo39RsB4LNUBeU5KjWZmDlEfd+tbaA6age6IIM5WdVIcnxEpY73s6agQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: plkfephyta+XXemzdJzyKPbkY6ptpRLAotBkuXEQcYgUJx5uxHS+n6Wrh7GCQQTnQJeIrnaajMETA941ZoyIZzNBs7RCUO0dcWKcJgG9I3Y1tIgpD+qcWhohvC1/sWGi34SvseGuZFBYqyEAoJE/flNFO1za5bzgpp640tSEzj07oPQdbtl+zGXM529dU21aZvdgu73LQYHJVsi31jhTtgzoCBiwUKjJLnxd9kdbCsIWQO8uOt1/8VllNXos5JmXlJPKL6gV0fEPd+A3+IfveoFttz1CBkq0zJ664fGogkktnKspS4EkNzJy18ZB40SZHgz8wjTEWFlJOdObhM8+h93RAD1hB9+y6a5V1YXnoGlfg6he6shmp5nLobjS81Br9tUGeqiITK57BA+BE04tqWaPlLJwrgU5aoN6Zm9fLnGNwuK7oI+tR7siy4Le8n0q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 15:58:18.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd10ebe-d92c-44a0-2e4a-08de85d05679
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085825_289888_79B3A502 
X-CRM114-Status: GOOD (  15.42  )
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

Determine the number of priority bits and ID bits exposed to the guest
as part of resetting the vcpu state. These values are presented to the
guest by trapping and emulating reads from ICC_IDR0_EL1.

GICv5 supports either 16- or 24-bits of ID space (for SPIs and
LPIs). It is expected that 2^16 IDs is more than enough, and therefore
this value is chosen irrespective of the hardware supporting more or
not.

The GICv5 architecture only supports 5 bits of priority in the CPU
interface (but potentially fewer in the IRS). Therefore, this is the
default value chosen for the number of priority bits in the CPU
IF.

Note: We replicate the way that GICv3 uses the num_id_bits and
num_pri_bits variables. That is, num_id_bits stores the value of the
hardware field verbatim (0 means 16-bits, 1 would mean 24-bits for
GICv5), and num_pri_bits stores the actual number of priority bits;
the field value + 1.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-init.c |  6 +++++-
 arch/arm64/kvm/vgic/vgic-v5.c   | 15 +++++++++++++++
 arch/arm64/kvm/vgic/vgic.h      |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-ini=
t.c
index 75185651ff64c..fe854cac5272c 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -398,7 +398,11 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
=20
 static void kvm_vgic_vcpu_reset(struct kvm_vcpu *vcpu)
 {
-	if (kvm_vgic_global_state.type =3D=3D VGIC_V2)
+	const struct vgic_dist *dist =3D &vcpu->kvm->arch.vgic;
+
+	if (dist->vgic_model =3D=3D KVM_DEV_TYPE_ARM_VGIC_V5)
+		vgic_v5_reset(vcpu);
+	else if (kvm_vgic_global_state.type =3D=3D VGIC_V2)
 		vgic_v2_reset(vcpu);
 	else
 		vgic_v3_reset(vcpu);
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 14e1fad913f06..c263e097786f9 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -87,6 +87,21 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
 	return 0;
 }
=20
+void vgic_v5_reset(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * We always present 16-bits of ID space to the guest, irrespective of
+	 * the host allowing more.
+	 */
+	vcpu->arch.vgic_cpu.num_id_bits =3D ICC_IDR0_EL1_ID_BITS_16BITS;
+
+	/*
+	 * The GICv5 architeture only supports 5-bits of priority in the
+	 * CPUIF (but potentially fewer in the IRS).
+	 */
+	vcpu->arch.vgic_cpu.num_pri_bits =3D 5;
+}
+
 int vgic_v5_init(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 0f1986fcd7d0a..9d941241c8a2b 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -364,6 +364,7 @@ void vgic_debug_init(struct kvm *kvm);
 void vgic_debug_destroy(struct kvm *kvm);
=20
 int vgic_v5_probe(const struct gic_kvm_info *info);
+void vgic_v5_reset(struct kvm_vcpu *vcpu);
 int vgic_v5_init(struct kvm *kvm);
 int vgic_v5_map_resources(struct kvm *kvm);
 void vgic_v5_set_ppi_ops(struct kvm_vcpu *vcpu, u32 vintid);
--=20
2.34.1

