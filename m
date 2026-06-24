Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A5CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzSF7jIrLRbrpksbVA2EYerPRL654ccREaYOAv/EJKA=; b=Kv04Q4HkOxbfjR
	SCj5xLWw6OpAIv5HR5NEojZ/JZtsARhyDiXuMZEbi5BYPgNLbSIGsta9m1EKf16cZgUxzLFPaCMmN
	JkyTFZi6gdfJ4pjXvcq2vkOmJck7Qf35aE387fGHfhWUo0DSUqsVUbO95FO16jwA4v6xN4VwbnDD7
	8YlqgZcxgrb0g1jJDlaYlFaQyGNwCGQzQGDu72fisULtQJh2t00/ziGU1D8a290jLn6CZEgI81BYT
	VJT0d/yzfYxO8DAfddGhCzL1qKFNivnhknRn/UFmbDr7a5qmT1nCzg8d5TQVmy/pU2ooccjz9IH3T
	I4WBNQcwPws9hYQDZf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTYJ-00000008Hv4-30ig;
	Wed, 24 Jun 2026 19:46:27 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTYH-00000008Hug-2Euf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 19:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnMq7P6k7TSXjzLaBhHuVPZweGgcdJ5Si6TLuqwmGEa7HtPritkMshCqADD/Xh/CwlHqBGIjFkOpJTmwJR3Ru/50NmpW9l7jBiIVZRROlKbF5mhs2CPB6EEd7Ih3o2AP+2Ha7EEoXBHSoHSozP1JiqkOiFm0XNv7wUUBTvvsRwy6CB8pRY56AYixUkWv/RzeY78D5rR1w51NbrSpt9EFDChXm5PKJY6sfQHaDunNgXbxNNre9IpY1qQ+NsdVF4ZhuttqbJMOCqk4ThRebO9EWHDBIP1VmoFvh8T02pybWbI5Kkz/1X4IMVaNs4hxd38x+AAhopNfrHmDPok8WoEvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzSF7jIrLRbrpksbVA2EYerPRL654ccREaYOAv/EJKA=;
 b=FBq6DjCp0y124PZ6wtjvs9Kmc1KFZ3m3Xfe3Wx1XpYby3Eg6FoamzIy9CvBNTCMlev6ydmpEl+r5P+kxQVutknzarn6boDEVMuyypTt1KeRdl+4iu8QxDIMbx3te+MEnU6Vw0Mg0EKRBTdiK1Tv3HMFA7io4UR48er/r91xaQGtkJsXWO9c4KIo7UMOH48BKvWoIa2lBekNy6VSzv87CzETrgS/4cuSKAbcI6XKsFV5P2rZHAUQSLbNmsM5uvLsiUiqwxhhwh+4Jnnkv/+/4Uu6VrXahI7U2CrQlIbLZyaS7B0XzlotMhE9MrRDqhkOmIOaUPUSr8tnuPkn1/8Xx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzSF7jIrLRbrpksbVA2EYerPRL654ccREaYOAv/EJKA=;
 b=NDU8eT2lZb9Q81i7wvWiK8PgPMQHaSephLwxRdq0ATXFHhXWhKjLu8not2e3ZdBfP1fzOCMtZhR/JgQhsyoLktmjyAUGu1yHE6Mw+P/RvM9gCDUp8zKHC+O6o0esw0FpSGpPTd5FVvXXYCeaUCDX3fDrTvW8nri5JakPGLSZCOj1TWxPdJrwarwSrvovjF/2hGTmOFM7SeoX6DEfwMu8SA4zBTr3Ktb5UjHPNGCn1OkUQEqja/q/C9t+TnU0VcUfQrfb/4LUUEaINNsiAviAPS/OIAalakieUS8z77wFQHM6REoVcGUPL7fXjq3mtVFV+TJmWkqrvy1ZUovFTiRC/w==
Received: from DS1PR05CA0004.namprd05.prod.outlook.com (2603:10b6:8:457::7) by
 LVUPR12MB999184.namprd12.prod.outlook.com (2603:10b6:408:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 19:46:17 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:8:457:cafe::69) by DS1PR05CA0004.outlook.office365.com
 (2603:10b6:8:457::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Wed, 24
 Jun 2026 19:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 19:46:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 12:45:59 -0700
Received: from [10.221.135.3] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 12:45:56 -0700
Message-ID: <483b7983-44c8-4a17-9db5-61b950a41ffa@nvidia.com>
Date: Wed, 24 Jun 2026 21:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] firmware: smccc: lfa: Add auto_activate sysfs file
To: Andre Przywara <andre.przywara@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-7-andre.przywara@arm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20260317103336.1273582-7-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|LVUPR12MB999184:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cdc4c7-5230-4690-1bb3-08ded2294167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|22082099003|18002099003|11063799006|4143699003|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Rv1sPxBkfXt32nkRuhtxNWWVaZG5kcPpEKGbuEN/FIxlTbvwB7gonLqVwEw+Wal23limz7L+/O0xzWK7vt43b6FY94kbRQlLpqd7i38nlhBMWMuVwURsiiSsI+gd6G6GrULACaI7K7k6TAMvZBMKgh0gJ4vlggx7495NHjj5LBtff/VkquB+Fw/Z8CjVrf0wk2PxMQcbwSXDbHzEo9/50Y6ZPAZtJ9xENUWADqqFq3QXYUHyrc+ZeOD4xbMX7rr66T9aINXSVUEN5IzCvtZxEkWvMgvBYMEP1vSXARk9fgLbefwdQOMSFmSKP7Aw/zT4nCbag9wgk08Ze+o8lIbwPDIOCp+gnXbHyfMC+DulEL7LzjJSEVHOS2NNdmNRDCU5DIJhs4/3gcM7jLz2jQNnLX1DzTgwiFnlMmjSVhAfpjYDfKCHB15LDxujqVQr3nv2AF8PZj+ZQJK7udj4xmkcN++Ln6I8CMmM3uA28sZEpW2lgDFGnNngI7EEkp30OLfqWt4m5joU4b5XViHVtlZmcbYSJO39Tef0fZO4Flx7O44GmU/SGWJT1A/Vi7f8A+wQ6Q+wfr5rQW6wvOY0YIlDOrcvse/seJOSmnFOcKuRDnzb6QmbxujldwEGAbAivjJpUWJoNXK6gvBa/8emNvtTVxwWTVAtdmYQDjTmNpSH0F8LZ3rXESjxRtiPw4pt0zKFQLEBVyxCfeqbo8eqEN1Ibg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5fNE7i31gUSRTJMrK3quM5d7XkMpWdrgjuEewvVAew8bfR2nVLDwL5sZrYOpyYREvHwGXyrNhS8sw07QAhmRHv67NP2DG+t+TqFV2gfqq3yXUdRSERFJfWDUoFLlQzC4V2oB2OpJd31o9rCn4F3gE+oyH7ztf6cef3Gl6OxgANhPm2BVoaeSZ2/55o49tEI4We/X2TrI8ueziMGfpUVTHGKtDeuBd+s8wLPtwWseuDA/gcN9+RkxtswPuZofhxsOVAv5WwCyl++OZSV4XDjT4o4gCSAJOGAFp/esyFAAjWMWLiiXpKbXHrwQX/eL/nmfj7/5hCDi/TnaQ3mIIsSUHdXPLXsaSoXvamDF8ptNLkcIyBz9jvHmZrfxDBxhsGhQKXav/Q00H2dD63luRbA/J7t84GvwG81jy0i3U35cRsn3qrvvD4zwpAvKSHC5cDan
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:46:16.4543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cdc4c7-5230-4690-1bb3-08ded2294167
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_124625_577498_ED9D16D8 
X-CRM114-Status: GOOD (  27.57  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andre,

On 17.03.26 12:33, Andre Przywara wrote:
> The Arm LFA spec places control over the actual activation process in
> the hands of the non-secure host OS. An platform initiated interrupt or
> notification signals the availability of an updateable firmware image,
> but does not necessarily need to trigger it automatically.
>
> Add a sysfs control file that guards such automatic activation. If an
> administrator wants to allow automatic platform initiated updates, they
> can activate that by echoing a "1" into the auto_activate file in the
> respective sysfs directory. Any incoming notification would then result
> in the activation triggered.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
>   1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index f20ea45cdbd9..5dc531e462eb 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -101,6 +101,7 @@ enum image_attr_names {
>   	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
>   	LFA_ATTR_ACTIVATE,
>   	LFA_ATTR_CANCEL,
> +	LFA_ATTR_AUTO_ACTIVATE,
>   	LFA_ATTR_NR_IMAGES
>   };
>   
> @@ -115,6 +116,7 @@ struct fw_image {
>   	bool may_reset_cpu;
>   	bool cpu_rendezvous;
>   	bool cpu_rendezvous_forced;
> +	bool auto_activate;
>   	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>   };
>   
> @@ -561,6 +563,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
>   	return count;
>   }
>   
> +static ssize_t auto_activate_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct fw_image *image = kobj_to_fw_image(kobj);
> +	int ret;
> +
> +	ret = kstrtobool(buf, &image->auto_activate);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t auto_activate_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_image *image = kobj_to_fw_image(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", image->auto_activate);
> +}
> +
>   static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>   	[LFA_ATTR_NAME]			= __ATTR_RO(name),
>   	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
> @@ -571,7 +595,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>   	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
>   	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
>   	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
> -	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
> +	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
>   };
>   
>   static void init_image_default_attrs(void)
> @@ -640,6 +665,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
>   	image->kobj.kset = lfa_kset;
>   	image->image_name = image_name;
>   	image->cpu_rendezvous_forced = true;
> +	image->auto_activate = false;


I think sysadmins should be able to automate setting this at boot and
after firmware inventory changes.

A udev rule matching /sys/firmware/lfa/<uuid>/auto_activate did not work
when I tried it, since those entries are plain kobjects under
/sys/firmware. The arm-lfa faux device worked better as the event anchor,
with something like:

   if (lfa_dev)
           kobject_uevent(&lfa_dev->dev.kobj, KOBJ_CHANGE);

Then userspace can use:

   ACTION=="add|change", SUBSYSTEM=="faux", KERNEL=="arm-lfa", \
           RUN+="/usr/sbin/lfa-auto-activate"

What do you think about adding such a notification in v3?

Regards,
Nirmoy


>   	set_image_flags(image, seq_id, image_flags, reg_current_ver,
>   			reg_pending_ver);
>   	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
> @@ -709,7 +735,8 @@ static int update_fw_images_tree(void)
>   
>   /*
>    * Go through all FW images in a loop and trigger activation
> - * of all activatible and pending images.
> + * of all activatible and pending images, but only if automatic
> + * activation for that image is allowed.
>    * We have to restart enumeration after every triggered activation,
>    * since the firmware images might have changed during the activation.
>    */
> @@ -728,7 +755,8 @@ static int activate_pending_image(void)
>   			continue; /* Invalid FW component */
>   
>   		update_fw_image_pending(image);
> -		if (image->activation_capable && image->activation_pending) {
> +		if (image->activation_capable && image->activation_pending &&
> +		    image->auto_activate) {
>   			found_pending = true;
>   			break;
>   		}

