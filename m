Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13047C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzGxVuQ5p6LcNeztXP2t/LLEjJJ7VQQorQ/5agmALZI=; b=F8i+I6sIg+gy7AjwgvqHoco+9e
	QRBmqt3zR77zLZAYxsGnRDy3om6SScoAbKDz+6EtskpU9tVNmGV5QQ58PSn0pPVJvfIaGmmMOzUqZ
	4AcxGCvBp0ttlLYVgxirCRxsO3W4FKls3Jup4uYgGPZZ++LQrW6nJG8eMg209t2xb0KzWKwI50s2g
	ZfUt/z5vl1hzZFymkdHqsysJm8tJDEXcBv8B0n0Ru/dC3pQ6+bU1TsXhcCAVC1X74NaMuzz63pN2Q
	Npwn46sXqYPnmzZe4WYYWRxy8mJ6ieZCdsuF5nYVRRu3LpWlf0SeS7fk7otqKfOXf/FmXXbK3oAwc
	naGrCDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU3i-0000000BWeZ-0pPO;
	Wed, 22 Jul 2026 10:20:14 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU3f-0000000BWdB-2wnD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:20:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNRt7q112kOIUGXExn8FD2x/llvXX8jGlJKRB2z+8oLvDh30APMmZLLh/EdWRUJPzArrZVVvD1FIHK7lL7AEwL1Yczsjn+3713IqfeuwnieWJlc3KKxSnLD0+Hojx+j67L31LGqNpwI+1Vt41GP6DdZPKa7ClvmR2VzrUer7RDgfpmLD5NzEljKAzhd0L+ixCwovK3uCLzkffurZ6tUtE6G2tyvGaD/tUrStSzR/mlrZG8Mk90EDFtHzi7BjtqhsYs6YOGXQ94Zo9SkEpHGGl4ewDzDswTa3natOUlnjjmGrtiHw8bCwz6RQOiEdBYYypakSWVVGeF2sMZ0wZOQ7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzGxVuQ5p6LcNeztXP2t/LLEjJJ7VQQorQ/5agmALZI=;
 b=QJYztU76Eo9UNP1aRUomOIMgAGSGnINpnLbu+4ZWHALODOuFFSdGnzxF5N/9UinpKJXu/ir2j2RJpTF7D5z/VkwhCQVqIKv2wXAkbAsnAjdN1o5bKPOKLFjLRo6gZQzqrrbadLf4cJD0BkaRuEPTvHfv701cwwukhmz5cy0WqCu7VmkfWjHcIoD9GA42mAVy18LVE1LGZkPygkHAODItejOp7PLbyG4jg4mCcVQ7UPIBLRkNNqRDaL63b6xITS2amr4imcHTmBjeawTYOO4cgy8ff3dSBIXPbnzWbuvYFsFC8Fmemwte+PdlINg2li14nDd3VU6zq3AgOnZn6wpiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzGxVuQ5p6LcNeztXP2t/LLEjJJ7VQQorQ/5agmALZI=;
 b=qzs7UhkcZpeKNkRDaVHCbIfRl5BNSuP3RAOmoagc6rfmCDJJb4n32kQuTqf3sQsPveBEZiGyZHu5qZggassoDiGwlum9YCte9kWrVc5YwoDv3uvd88GARs+/tOi0zrurMmpYuXvg1fS6UkmCUg1R/At+Hgba1vdnDZqwxtcExjPEMZ9bphLiXDY2DFhuaQJ6WxGur53DUMUH3MPdJpEjgyYvAsrP1ADSSwfopmw5nTHCM9IulibUnD8QOGqO1YZs13keBzUVu4q7qmLY7yf5NnSxGFuxpP7FIWUrLWeISHU0/HIwzLEdx0+4YaeoeJlr1Mj1D1Av5gRXJTWnihOttA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by DU0PR04MB9493.eurprd04.prod.outlook.com
 (2603:10a6:10:350::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:20:02 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:20:02 +0000
Date: Wed, 22 Jul 2026 13:19:56 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Albert Esteve <aesteve@redhat.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] drm: fix missing header include for drm_panel_put()
Message-ID: <yyxsekj7xpteyjah7the6ojqgjer6iygms7hanxoym555yuy3n@ge7nki4nlpvc>
References: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
X-ClientProxiedBy: FR4P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::19) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|DU0PR04MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 84591480-c19e-41f1-fd24-08dee7daca67
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: udt5rRMFNOiCvrWEpKSllFzxfEuhnRVhfCCpq8SST9i8EXZeaIJOcRngiJgjcpU3NzCvVTZKgEjkZXvDPj960ZgJ6JnRR6nUAf+szP/PQIIF6OUpyJn3uCbtXzLovZDTAxijJx9WsgAOGu6siBcip2rsgNvESUOoVvehRghdZBPeZBo93/Vomqh+XNyuvWAaZtqeNUOYTAZ+qqBl5wDdE4O+Q6eMmHYnXkk0EVyl4MesL2hvhN1T/MEd+aSJHcWUDUUUHJtbZHmJUDxJZE5QJmy+AI/9Hn4r392Xmkj25EoSBAU4/vkj0STy7o7iah9s8GSkZWNrZbLqEpQB7gsm54sbwZY8OCsx9zpRWDd3+Hw1Pdl0i4ZfepEZGvhoLq86ZDyLOctJbSizAfdFZpvxuL8JtcPaiZaFmSiWmkl1uUMaC4ayJsjF5EUjUEEnxYHioY0Eh0HEXd/AppAktZkOsBFyFP7cD+GolTto8qaOaEXKHd1ITk8VNybrP9ZgfNgZGGUdAllgSbhLK0B4iJefMorXTX8jjE7aEa/LGdOzfRKTQ2yzFSpamfNIcbidUQa1yVZwXlhW8Cc/kKq/foavENZrU36puESNBFeqq4waF9JdhA02fFrBLyyawA9b8jDNCkYBevEoBNCJMgWL3r8VgXvE+7ie3uJZf+zlwoBdAps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wu0QtIQIpsVmGu+JT7wOmqMctXHSncwv4uFItaH7MweaKsBCwEkrdfO8gBvg?=
 =?us-ascii?Q?vKcsM7vNR3TFhLae2syb7fdG40Uh3aQcIl2qaJD5Ai9l2MBnZhNMS1LYeVdC?=
 =?us-ascii?Q?SSqgRjpI9+4PAp1KeCNX+pW8A9lCCO9v+EZ7n/1lz4GvpT6HiIvZNlzoq4YL?=
 =?us-ascii?Q?hyDcjB10rdfUwALGnpwNRaSwPI4LsMxyy3Ic6y53gfTFB+xRBbWmhCWtVfi9?=
 =?us-ascii?Q?RWY/byuxkXhU+U8mSE5E5it2Sb3/SZCtOqZmxaut8ERq8woZaU3T2/isTXD2?=
 =?us-ascii?Q?2ug5sEaKdAKSKBXs/OzXCGlW4SU8/Dh3thsXJc25APHtnxVplcte0dJJswcy?=
 =?us-ascii?Q?p7lSQH30gyQ2zquAlU5fxl93TQ406kMTRnXD0pxa20WRmgPgegru5UL5JGxA?=
 =?us-ascii?Q?Cg6jM7R7V+TbM6Yxnhec4FJjd7waID6TEk5kWov4pZh3hNEdRZ/Spl3NJjyp?=
 =?us-ascii?Q?eNjvVXobXzPJRY4G8Db6Deh8CeWP0UP8z7gjOUBDVxjq+O5+KMP9fjDLp+cD?=
 =?us-ascii?Q?QnS+ebiZ5QcFJ9U3ftvaivKd/E5PuAQyMewfWOxtvSm0fRrAUh0rUdcGrq96?=
 =?us-ascii?Q?wPERvyvaMSPm+eRIPKRmoxe8S64TF5G0ug9pZKUjpw9Cdb4BUbDZSJnCIRx9?=
 =?us-ascii?Q?SpUiF7BHzTLxg4qqBWpkazURvEoTDpk5mCewt7ufjiK0LWdrYk4H7V+m5rjd?=
 =?us-ascii?Q?vusgm2xUbt/5rirsWxadKrOmS7sF5amJq/NzQYCtrQR/CfqCwxvvsHw3/1N+?=
 =?us-ascii?Q?Il1YACg00HazDF3dh6Hjrb/ayjAipaOMqtV5Pyq5BETlKCi0CJiR6ccsmZqr?=
 =?us-ascii?Q?/ni5IFof7vYxj4P1GGyCK9eR403GnPwb1d3qXk6+tb2xW4rJv+8mu0o1+NTg?=
 =?us-ascii?Q?+Blqh8xRGBDxY88yB20uvvzkUh4iqOhXWqTOCzMar9fGbULkQz1BYUiPrM1X?=
 =?us-ascii?Q?JKMSyfeCuW689vYs305opt4oMLppUWW7KFY/Sm7P2zrcx4Ud2TfsmaQblBl2?=
 =?us-ascii?Q?Ta7CF8nkI8sAXd9D357qQbBPp1NohNqI8eLN6Em4Ozh43E+IOnsAXvLBpAa6?=
 =?us-ascii?Q?AFDeR+UC2W+yqMwPySv/MaUizbeoQ+tWC1CuW1xBhHvZAuFAdjBgCl9TVb8s?=
 =?us-ascii?Q?xoB3h8lIdnRBbz0Lo6een/OX+Dynk1NKjsl+HQvB/x1ykGeDun8LNWJ9hbHo?=
 =?us-ascii?Q?HDVkFDxo3+h6pBJPXgqypBRHMv7ZmAJVxpstOUGSvFD/uo5fPR43rxC1Y0gj?=
 =?us-ascii?Q?Dh1goGSw3NL5fOL2bOvcsH8Si1W/mcxOdWMPmURFz7tKgxcbP+wh08iuIqBj?=
 =?us-ascii?Q?6U9nqw7bas7Cs7w9J2Mih4vLEFwns6O1ELxzNaYZ9Z5U0nO3oD5SbenDCj4R?=
 =?us-ascii?Q?SZ/rIqc0IzOz3qMV7PFtkQdrWo2ydDxMLGQrTVI56nLXoSkpjeWYDtqYkyNo?=
 =?us-ascii?Q?d4mWiMbmDhByOfuJWN5nq6Jx/2prg1jpVtVeM5ZRyoHdqorJ3hgBm3eN4KhR?=
 =?us-ascii?Q?BQwROqkYflpuoeP033SZpKGGhd4OFFwMbjpYtdd+FVV22ZyvPRT9qagUVBuW?=
 =?us-ascii?Q?dT0ADbNGHo5LMw7ubczPr7U74zn5wb98z+b2U44QMbLDif4ox9wUMCXtRtZy?=
 =?us-ascii?Q?PfPWrc+Vjh6KankeBEBojgZSO8KkixwHzFOvgisPQmNlxvwYS/0/lZeaNX6C?=
 =?us-ascii?Q?HK7A+ASTdMcP+s/wtJfat4lxSjF+PWGvzTcCQab34zfwnNwdv6EZ5vTuiXRv?=
 =?us-ascii?Q?Iyh9w0C0VrvFM6dJbYxNwzmai9rhlwE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84591480-c19e-41f1-fd24-08dee7daca67
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:20:02.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpIbem00duGrTL8kpGa9FOSFrE3jPye6t+3ieRMmJfKvuQFA+vWWoD4MCO7SryIfdoy8WPqsPDmj683FXsTzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032011_753666_CB134717 
X-CRM114-Status: UNSURE (   8.09  )
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

Hi Neil,

On Wed, Jul 22, 2026 at 12:07:30PM +0200, Neil Armstrong wrote:
> Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
> after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference").
> 
> Fixes: b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu

