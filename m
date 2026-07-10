Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58406C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7txbPYZWn83Mw/q7zOKn2XWA2DVg7+l/bONmz44BYkU=; b=PXykwHb8qd1NY2Z30sDNZ1MfI7
	q3K/cOrg0K/ZiqqVAqmrODzWlfjboDHANdnIoJ5xEJu4ew0J9qWg5PtBNkyXfDtN9GKsHJPWQ6v1p
	TVJ+mfiqCxGWyOL0DBtiq0sPKn5wv8LVzzdhI1pFzkWzPU8DMx5AtkFIMO85wBq5uXzD4SM9ls1wo
	7fv7RnsVjoyFedOFc0bwVOT1I2NXRsOSwSPHOV/8dRoBYxohuG44a4sAWmU+YM2KRK43QrqwnXP4F
	N2EMLZ8h0OiOgT2lTV3MQa/dz6s6WUrETPK+F6gFDHnMy9jTFAjV5X/T81mt/RDSSkewSaRgDP1MB
	YU84NtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBvX-000000053ny-23GJ;
	Fri, 10 Jul 2026 14:10:03 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBvP-000000053m8-2L1Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxMO+IHuiJPA0v4ruGzjfH57KyUS0k/a7JGOhgTFYyGUUvMp67/h+vup9j9KiwmdlF1GcSxo/N9F4tbh9KNfQCcvjIu5bn34BIAvkCXQkRdgyJsijsbTv45MeXtlDdgEW6zmgBYvTCqjdwxSQx574KSr/JBhBTs0IoFmtWV3rA2QbXBZWICHSzleJtfX2A06ZuRdUlkKg2rjCkrZ2Nq3lNYcIOia7KJGk2lTPnn0R1OOSUeb+RfTgLg8wjJkO77MIMHW9ozmGKOhSZzbYjlO4tcXRtjaTCwZRgkuI/8BW1xzQlRGJlIYvC5W4uIx+TS/YSLYL573MeQGaGMtCWwSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7txbPYZWn83Mw/q7zOKn2XWA2DVg7+l/bONmz44BYkU=;
 b=wi/Yr7iqVqiun+4d1JJDkT+fIGK3e0Vs4kpwe6i9GlynwM4ACrucY9u5+uzb9LA2n6DQDXMWvGP5uCMNQ0HDN3pHPXi5ACjY+PLcxukQh2GKYum0kRLRzbAEuLkJcGgiYpRuTBBZZxgD9rYJdAdbuxUA4DIED5zt3bVPQDx3K8Ip3eZlWV2fxF1WQxRmf9kDlSzZ1LYAboau+Dr/H5PieluH0MhuIX3B/sxAxp19sq3JDEr8ecGaBGTMyn73T6vbkmG1AciDEwgAR82enrcFkB67Ubxiq4NouolitvtNTTxTD4KOO5nDTcEHLxnlbEBp+3JDcfffOzLcUNRvQfXC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7txbPYZWn83Mw/q7zOKn2XWA2DVg7+l/bONmz44BYkU=;
 b=RmA3YIfO6T5ramcxxeluZURUNKlCjzyjIq7MlNNabOPci2oII4jTIC8J/FRX/IGle9wbmh66pQrFY68Vf8oLN15ata+OtsvppSIWmTUsMab+e26ro7hhBBvw3gfqxZwNTzaeZXXHECIz3agmRmm+6e7ok6ba56b3xfY42GEN6Cj7xkEfalQlXQ9sztsERIO0gdZp7lXEdDp5ys386gHfzaZiu2y4W4TnLATRKazdPh6Zy+rYJOk1LVtS5TOxjEjQBvarm3xzpkHnUyaCDBHBkL4Io9tQVdFhO2nDJIqHTMLvW/fCF/XcqgXQtKKdwXg/846CEKDBrirW+5CGW2u+bQ==
Received: from MN2PR03CA0025.namprd03.prod.outlook.com (2603:10b6:208:23a::30)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 10 Jul
 2026 14:09:48 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::f) by MN2PR03CA0025.outlook.office365.com
 (2603:10b6:208:23a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 14:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:09:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 07:09:17 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Jul 2026 07:09:17 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Fri, 10 Jul 2026 07:07:40 -0700
Message-ID: <20260710140856.3323523-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-6-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com> <20260706134455.132091-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d3c2c1-8fa6-4bed-a9f3-08dede8ce6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|4143699003|22082099003|6133799003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: Peh+z8nTaXliVrzkls8WvY8uxcNlQBk1Dw8vuRaOBdi+hg2A69GglOaaxpI12S8SUD08WLAy6kz6peORJhmUZBWb6y1Cbh3Onk9ZQnb2jKXgevKhSsno5Zu7z24frYKsQpvwaND/Mk3/C71UY7xvOKHO8YDN/NM7rwfGL4d5nW31b7+DsdY3VOjprQAdT93zqJQcFshhb4a3OhH32hsGNtjlEeYYZAk+/j/figgx5bUYjY2HOZfqsS9UNLivg8Zo7s+p9Djj+DO9NxBc2XQhzaFQRUL0rB3nx+u4XqPmVpaM++Ot+G8sZUgbnUw+woB1R79P9CX39TRhY601nerMRfeyF2wtAmi3ViL+Lis6HjRU3IUQeqCc90/vD6liiihiqwTIpvD03/ICUP/XTWggYbJfz+w9XPbnIDn1LuFNhw+HckhVXXFqpRzxnpDKV0yI5L68QKAkO7PJvu53FJhMyK2bPcfGJw5+En3u2V1B/z4SjrCtNh/Gy8GjC1H7hvOA8OmkzlFNH4sQsLzNMv7nlBFqif+zEeHzmnnB5/JBBzNupafqb3PA1qduK4EtQRX2zyfS8WV4lXeGaboZbdpTAgSd/KdKeA5M7tzXQzTQV1RShk0L9TlI9wqy1erJFDYMLJ8CPmnO4dqeXzjeDVnrQFC3kQK7LQSOLRkBqYCLksWUVaaNF/na5MCRh2A/dJCCtI1ZcZoKlnY1ev6NPrThOA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(4143699003)(22082099003)(6133799003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TPVjzjylkhyvfwfdijyCkaGi/5hRX8pbLmZeQVJyaB47kFZj+a6/60ULDnERhNSbr2BvyitNvio4kT9WKtvAf7hOu9Us9vR1zuvmJc4a71j4f3wZtgn/USuwGF1ckR88Ye5WaKJzXcGLfmfV1f1por6sAV9+pbdrkqLbNN4R0TrxEGt58wSZgKfz4lERoRpKMdznExC4KVdiM93VoKlN+4fD0ivPI8uIb5KtMcFewcNuYgwAFfRcaIdFzbefFHbwlgOeUQYB8yKYoKcv8cEW9gis7OVKfyVd64A4U9RTNZX/nVYWcTfVPtzyoh7YwTAYcFTVc5cf3eCsdAflW5Tr6Sl2PjExzy/N+MS09pIjW7JWAVFhW4Aq/Mfv0wmqNm2MfXh1Dif5fdEuU+HAKp0xiSCqPUWYruXDI/0QDCi24DYhQrFvLwW3hfKRs1eGItRb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:09:48.0335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d3c2c1-8fa6-4bed-a9f3-08dede8ce6cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_070955_623328_A6B33A98 
X-CRM114-Status: GOOD (  28.65  )
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

On Mon, 6 Jul 2026 15:44:45 +0200, Andre Przywara wrote:=0D
=0D
Hi Andre,=0D
=0D
> The Arm LFA spec places control over the actual activation process in=0D
> the hands of the non-secure host OS. An platform initiated interrupt or=0D
> notification signals the availability of an updateable firmware image,=0D
> but does not necessarily need to trigger it automatically.=0D
>=0D
> Add a sysfs control file that guards such automatic activation. If an=0D
> administrator wants to allow automatic platform initiated updates, they=0D
> can activate that by echoing a "1" into the auto_activate file in the=0D
> respective sysfs directory. Any incoming notification would then result=0D
> in the activation triggered.=0D
>=0D
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>=0D
> ---=0D
>  drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---=0D
>  1 file changed, 31 insertions(+), 3 deletions(-)=0D
>=0D
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c=0D
> index 5b7f9b07f6c8..ce4f966db475 100644=0D
> --- a/drivers/firmware/smccc/lfa_fw.c=0D
> +++ b/drivers/firmware/smccc/lfa_fw.c=0D
> @@ -89,6 +89,7 @@ enum image_attr_names {=0D
>  	LFA_ATTR_FORCE_CPU_RENDEZVOUS,=0D
>  	LFA_ATTR_ACTIVATE,=0D
>  	LFA_ATTR_CANCEL,=0D
> +	LFA_ATTR_AUTO_ACTIVATE,=0D
>  	LFA_ATTR_NR_IMAGES=0D
>  };=0D
>  =0D
> @@ -103,6 +104,7 @@ struct fw_image {=0D
>  	bool may_reset_cpu;=0D
>  	bool cpu_rendezvous;=0D
>  	bool cpu_rendezvous_forced;=0D
> +	bool auto_activate;=0D
>  	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];=0D
>  };=0D
>  =0D
> @@ -550,6 +552,28 @@ static ssize_t cancel_store(struct kobject *kobj, st=
ruct kobj_attribute *attr,=0D
>  	return count;=0D
>  }=0D
>  =0D
> +static ssize_t auto_activate_store(struct kobject *kobj,=0D
> +				   struct kobj_attribute *attr,=0D
> +				   const char *buf, size_t count)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +	int ret;=0D
> +=0D
> +	ret =3D kstrtobool(buf, &image->auto_activate);=0D
> +	if (ret)=0D
> +		return ret;=0D
> +=0D
> +	return count;=0D
> +}=0D
> +=0D
> +static ssize_t auto_activate_show(struct kobject *kobj,=0D
> +				  struct kobj_attribute *attr, char *buf)=0D
> +{=0D
> +	struct fw_image *image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +	return sysfs_emit(buf, "%d\n", image->auto_activate);=0D
> +}=0D
> +=0D
>  static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] =3D {=
=0D
>  	[LFA_ATTR_NAME]			=3D __ATTR_RO(name),=0D
>  	[LFA_ATTR_CURRENT_VERSION]	=3D __ATTR_RO(current_version),=0D
> @@ -560,7 +584,8 @@ static struct kobj_attribute image_attrs_group[LFA_AT=
TR_NR_IMAGES] =3D {=0D
>  	[LFA_ATTR_CPU_RENDEZVOUS]	=3D __ATTR_RO(cpu_rendezvous),=0D
>  	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	=3D __ATTR_RW(force_cpu_rendezvous),=0D
>  	[LFA_ATTR_ACTIVATE]		=3D __ATTR_WO(activate),=0D
> -	[LFA_ATTR_CANCEL]		=3D __ATTR_WO(cancel)=0D
> +	[LFA_ATTR_CANCEL]		=3D __ATTR_WO(cancel),=0D
> +	[LFA_ATTR_AUTO_ACTIVATE]	=3D __ATTR_RW(auto_activate),=0D
>  };=0D
>  =0D
>  static void init_image_default_attrs(void)=0D
> @@ -631,6 +656,7 @@ static int update_fw_image_node(char *fw_uuid, int se=
q_id,=0D
>  	image->kobj.kset =3D lfa_kset;=0D
>  	image->image_name =3D image_name;=0D
>  	image->cpu_rendezvous_forced =3D true;=0D
> +	image->auto_activate =3D false;=0D
=0D
Following up on our v2 discussion about the udev anchor after the=0D
SMCCC bus rework: I got a chance to try v3 on a real machine, and=0D
like the faux device in v2, the SMCCC bus device also works as the=0D
udev anchor:=0D
=0D
  ACTION=3D=3D"bind|change", SUBSYSTEM=3D=3D"arm_smccc", KERNEL=3D=3D"arm-s=
mccc-lfa-*", \=0D
          RUN+=3D"/usr/local/sbin/lfa-auto-activate"=0D
=0D
Matching on "bind" instead of "add" worked better when I tried it,=0D
bind fires only after probe so /sys/firmware/lfa is already=0D
populated.=0D
=0D
What is still missing is a notification when the image inventory=0D
changes at runtime. I tried the KOBJ_CHANGE approach from our v2=0D
discussion on top of v3, emitting from the SMCCC bus device after=0D
the image tree is refreshed, and it works: the same rule re-arms=0D
auto_activate when the event fires. What do you think about adding=0D
such a notification? I can send a patch on top once this series has=0D
landed, together with an example udev rule. This is what I tested:=0D
=0D
--- a/drivers/firmware/smccc/lfa_fw.c=0D
+++ b/drivers/firmware/smccc/lfa_fw.c=0D
@@ -142,6 +142,7 @@=0D
 };=0D
 =0D
 static struct kset *lfa_kset;=0D
+static struct arm_smccc_device *lfa_sdev;=0D
 static struct workqueue_struct *fw_images_update_wq;=0D
 static struct work_struct fw_images_update_work;=0D
 static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];=0D
@@ -229,6 +230,19 @@=0D
 =0D
 		delete_fw_image_node(image);=0D
 	}=0D
+=0D
+	/*=0D
+	 * Notify user space only after the firmware image tree has been=0D
+	 * fully reconciled, so that consumers reading /sys/firmware/lfa/=0D
+	 * see a settled inventory.=0D
+	 */=0D
+	if (lfa_sdev) {=0D
+		int ret =3D kobject_uevent(&lfa_sdev->dev.kobj, KOBJ_CHANGE);=0D
+=0D
+		if (ret)=0D
+			pr_warn("failed to send inventory change uevent: %d\n",=0D
+				ret);=0D
+	}=0D
 }=0D
 =0D
 static void set_image_flags(struct fw_image *image, int seq_id,=0D
@@ -925,6 +939,8 @@=0D
 	}=0D
 	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);=0D
 =0D
+	lfa_sdev =3D sdev;=0D
+=0D
 	init_image_default_attrs();=0D
 	lfa_kset =3D kset_create_and_add("lfa", NULL, firmware_kobj);=0D
 	if (!lfa_kset) {=0D
@@ -966,6 +982,7 @@=0D
 	flush_workqueue(fw_images_update_wq);=0D
 	destroy_workqueue(fw_images_update_wq);=0D
 	clean_fw_images_tree();=0D
+	lfa_sdev =3D NULL;=0D
 	kset_unregister(lfa_kset);=0D
 }=0D
=0D
>  	set_image_flags(image, seq_id, image_flags, reg_current_ver,=0D
>  			reg_pending_ver);=0D
>  	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,=0D
> @@ -700,7 +726,8 @@ static int update_fw_images_tree(void)=0D
>  =0D
>  /*=0D
>   * Go through all FW images in a loop and trigger activation=0D
> - * of all activatible and pending images.=0D
> + * of all activatible and pending images, but only if automatic=0D
> + * activation for that image is allowed.=0D
>   * We have to restart enumeration after every triggered activation,=0D
>   * since the firmware images might have changed during the activation.=0D
>   */=0D
> @@ -719,7 +746,8 @@ static int activate_pending_image(void)=0D
>  			continue; /* Invalid FW component */=0D
>  =0D
>  		update_fw_image_pending(image);=0D
> -		if (image->activation_capable && image->activation_pending) {=0D
> +		if (image->activation_capable && image->activation_pending &&=0D
> +		    image->auto_activate) {=0D
>  			found_pending =3D true;=0D
>  			break;=0D
>  		}=0D
> -- =0D
> 2.43.0=0D
=0D
Regards,=0D
Nirmoy=0D

