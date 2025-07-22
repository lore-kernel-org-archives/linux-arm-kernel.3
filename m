Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DF7C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RjC1UNh9HF65J8+wYOp/nkpfBEDEexnSw01K3+GQwOY=; b=GkbUH9hTK8nHbkExu9/9EIDtKb
	okeDhOyDypVexu+XlK4J99vpPQvtLgTVAzp/HY3Tz91ht899Kjou+mkxhACd9r9yG0XmI2U18rXac
	C6q0pXCyWsJI0S7j4javAcT7y11t0a/eAtCooEZliKYJniAo1K7gviopKoQ73m2gUyeGTr/lWqQOL
	a3DT+6u9sR9V4b6EeRUArhLB4OteACi4DqaUlgPewRx/iE9f+w3ecBuL5ddwRF26Fg3UhQlHJXi3a
	IsBdK4RCbMHo+nYHZ8SigdSrgH7g80g8B8Kut+tU3FcD/Gh9QP6mK/Lkm0aCz35kgVc0l0SM5J9tA
	U8jc91pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAB9-000000029KR-1aHK;
	Tue, 22 Jul 2025 10:24:59 +0000
Received: from mail-southindiaazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c409::1] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9wE-000000027MH-1LtH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOd1hsKmkB15mzbKvwYNyNb27ieQtQjoT01iQKnLxSp+CdBg0tyXG/6ofbQgPZ0flTalMyMIFukIEs+Wgf331pBdWSRSMMymDC3UdsQU2fTql8zRnaUf96WNhplOoiBCX3vmlKJmtWqbV/wp9laEt7zY4CvcOOxZ2KUAValVXnDatHPicrbS9k7ypTpIF7YxiL8rIwWO+YGnZuNDqVCtBmOgSY46/dssTTcoyV0ABvJ3d/CySmvjwD+8YSt3VDwEKs6lDiMS5TN7ISF4+TxO8nixfdhMMjIRpdLM5K2QveGfPDhJXboaKQZ7QxM5TpAka6YdgGISF+O/+fjW3tjBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjC1UNh9HF65J8+wYOp/nkpfBEDEexnSw01K3+GQwOY=;
 b=qDVHvQV8RmjeMOXNxhltBdPsyby0YctPoZBKR/7WsC4IfnWKGQvOr6e0ibij4e31j9lxVmL5i8ex8/INNQ1Akcyh/9siLuBwOLts/Wv186PGu90hJdWUv3vzhdi4E8tT3N6zkaodDlc5BU3Mml2b0IiScYW3tW/3TRAvz2HlU2N3dXKewNvuTEHxg2k1AQ5G2kBbp9eLzdD7VOKpSD8/NN/8oZf+ycyA5tX7wNgB7J/HOV2f4bo+xNuGml4gMQmGU357K/TyqJxT8p76jJ9r4XaxNd3ETJJEVcZKbFo257PYvKCO3w8TKAnlqy25yzHhd4+HzQHHCkKJl73Z2EEuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siqol.com; dmarc=pass action=none header.from=siqol.com;
 dkim=pass header.d=siqol.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siqol.com;
Received: from PN0P287MB2919.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:224::21)
 by PN4P287MB4194.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 10:09:22 +0000
Received: from PN0P287MB2919.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce9b:461e:d772:ff02]) by PN0P287MB2919.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce9b:461e:d772:ff02%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 10:09:22 +0000
From: Darshan Rathod <darshan.rathod@siqol.com>
To: linusw@kernel.org
Cc: kaloz@openwrt.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshan.rathod@siqol.com>,
	Manish Narani <manish.narani@siqol.com>
Subject: [PATCH] soc: ixp4xx: checkpatch fixes done in ixp4xx driver
Date: Tue, 22 Jul 2025 15:39:04 +0530
Message-Id: <20250722100904.735395-1-darshan.rathod@siqol.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::10) To PN0P287MB2919.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:224::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2919:EE_|PN4P287MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 623e8d3f-28a6-4d4e-9315-08ddc907d49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mnDWxackBAqJqYM82Ah9gHlDpxfYakSPAsxmvaYowDIDjfuo85br08VMWZLA?=
 =?us-ascii?Q?BwpjnTGXXzKB/ZGw+V8zDpHpnVZxwen9WICgBx+ouKCX+tiafOqb2WyR1adb?=
 =?us-ascii?Q?+9mY8W+IzcVWlH1yCcj182a43EMeDJNTTYcwOBckWlhV980Ei3mij9721gKe?=
 =?us-ascii?Q?GfI8rcX0WRKmr0PkGTOp0Jj5YD6MTo9+NnadgKWAgIeeOHamx/fcP5pUBgPq?=
 =?us-ascii?Q?/2myC9KayvrUnD9I1/EwtjN5K4q7n+bYjM14+jSi3K13/3IB/YRCg9Vyc5sw?=
 =?us-ascii?Q?eBElX7oZ7Z0IWmdM/Ad5uYRzx4Wvwe1lrXsvv6LJK6iBYpo2Uxen/3xtiOJ6?=
 =?us-ascii?Q?WZ6BoNa3irzg8Ge3tDFGhS9ofHn0PF/mZD+qN3aoIZDKsPrmhh9ILf9inAKL?=
 =?us-ascii?Q?HNac7iAs18zBSwHLsjH5P2nzxLLrCl4ieFnEqgZtXnP9m8PKF9oGAfEvPuSc?=
 =?us-ascii?Q?HpRi/3gA5wmAh1P8kN3O0hewYV8B4rMJCig0sl41bj7RQtk0/NZSZWcDGAo3?=
 =?us-ascii?Q?IAtcrD2v/5i6saejBhkfGFrkhn1pZGiGGtGaDIxl7X3UJnF0q6ui+DzEyNIJ?=
 =?us-ascii?Q?llPi9pmC7OPnv4Pj4yIWvjyfFkZwhEQVTma4FaSknUH+hYJbhAnGsLsBE6sf?=
 =?us-ascii?Q?h14ZUmtbC1LzbZaxio1sin+uJA9fbv9cytPXGzG3YRMNePENjymtZcPGNl5l?=
 =?us-ascii?Q?SwV7I6z6w1ZnmMlaOiBHzm47kZpCBkUu66R+N+Mz/8FID77n5MWNr2eL3FRJ?=
 =?us-ascii?Q?v0HAqqQCOUvXi994sd+zMBW4dEnyZ0al1PRe1u2HZZlJTRn18Hq6GD7toH9G?=
 =?us-ascii?Q?80iy5MJbG95CJbbiiatOv0FgPmBMITt/TLTxq+XBHJ0xknh6MfrhoHHHR2Z6?=
 =?us-ascii?Q?nUVN29HhPwLvX0vwfvQfzdtfHVcRez3WpF4OaM5G0y0ZV2ME4KhrAwElXQu2?=
 =?us-ascii?Q?peEy11Aw0JpiOU4Xup1EZgXA8ZUDrIqWWrD+vQFjTrLD8lx3MSTdxGzqryuI?=
 =?us-ascii?Q?Givz1o7apitzWosHX7QiMKqqDPOD4BR4t4EFj65cwtfJ6anqG3KYNUl7pExM?=
 =?us-ascii?Q?wN594fSKUQQTpfPYpTHng/M0NKKzpJAdZSx8cm0XxX7DYlLBzNrI2pD7LLrf?=
 =?us-ascii?Q?2ca4t0352jNSmHMjUTvfUd7GnacmnP8HB2yhzt14eU9tXBeOZe3+K3b5MlEs?=
 =?us-ascii?Q?VRCAUZdeTpxh1tAyDnsd09mzzF9DLWPZO+UOnZQm2rmkMP06KH5EAQ2+b6Ev?=
 =?us-ascii?Q?AP8ITsVBkSx7N44zoXUXTkWxeAeaJr7EOBQ0LxEL0vEGFmJJpVrOe+BvXJuF?=
 =?us-ascii?Q?o+kPOcL7ncAyUuJhbQbXJatVSv2tuRUlAkDwH2XBkeviGeQUK5vLX9tP2EW1?=
 =?us-ascii?Q?F01bxq4Yt+3rJVLrLZG7+k5MjDcFudHN1hGNmsVXvcr2AN/Lbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2919.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BCGF+3mUyZ9EwMa8gIjmnHmv3A4XPJ9luPCPWD9XeOan05106QJGCWFfD+IH?=
 =?us-ascii?Q?0rqyg2kjifbsg/ZZD7nAErapEmeBsrhe7yvBB4CeD+Vjk1R0GPkiiiqOs+Up?=
 =?us-ascii?Q?TJFrdDDzpM6Evuyq164m/MISh/3RoKvY9GluXr3GJ6a6/tZhSZqsKMzEAjbI?=
 =?us-ascii?Q?+soKN1qG8rIq1XfBRXXgNL/ZNNBwRxr9WIaPlOfzT0+REJIFwSVR3ngyEgp1?=
 =?us-ascii?Q?zgUlLNcip2yZREtbxEue61I4KXUDVhzMQTTjSVOBYlu9JJhqpgkRgpzLRQ98?=
 =?us-ascii?Q?u45vVEYhRZU2mtp8mGlYe7jpku+UeisyNDufY4XyAm7S0I8/MqDl2pjOVMcT?=
 =?us-ascii?Q?isUbYvChCmrG2Aud4sGUw496Zhb40A7N1cMceO9sMjXLAul8VNCjLk1tkBBq?=
 =?us-ascii?Q?wf448czzcEF8811YxFOouLHNEQGI8dNJKsSGcyCzaY6WBeWKPlmrs3Rh4rjd?=
 =?us-ascii?Q?NoavkQ7qz9wpkNfS0pCs5siEtS8evcSu5VPgk85xQ4qWKhWZ/lyy9Nj1yT2S?=
 =?us-ascii?Q?IrqjfVawd4Bh/d0DBnFVLD033e58MnHPSxXdKZJT5WW6ZeQMVlpOtk+Q8sXr?=
 =?us-ascii?Q?Dc9RRNJXkM96jaJyUcC+HMFemFL+J11ilAhj+7xLo2fAzqbSuDQ1OPlgu3rS?=
 =?us-ascii?Q?b46000OnIF9UITNwsVSC3hwGCVv0C65agCDJGVyz3av9lc5KbSO2HP1ecxO1?=
 =?us-ascii?Q?d8wf47/nOAxD5Gb5WIPwmFELHvpADyk7r4HAW3ZwLbJ4Zmz9F2V5QsOH7nQh?=
 =?us-ascii?Q?6EEuJxe2H3KzBM1LjnNFAS325Z02jyzu+j1mYEWhyNJa+LcjJcwpTT8C3ICQ?=
 =?us-ascii?Q?FhEs4xB6HGzv4n2qxbwuLiMK+rKFvMhz0ZOUKWPtDIlodksLvCuqIHYkFX2k?=
 =?us-ascii?Q?GDoZ8t8cQsO9zRvfnIsytCEixNkrZrsoCpRcbYzLlwlsB8EKna//vQl0wVE+?=
 =?us-ascii?Q?wAKhevXim82lwhpQwzjYbmd+Tmct4+YPc5O8er7dGVuv28F6A0WKoSdDH8Hq?=
 =?us-ascii?Q?tbZltRwvTDE5/cKHkIl6BjVN199qaheMHiVoyGEAkcdDq2xiOUpWDBqvJoDb?=
 =?us-ascii?Q?goynvFBD/vEjaGWl42y6YnwvWqA8YE4ivUIIKEwmPM/Ow/Vk6FPkN+oNbk2A?=
 =?us-ascii?Q?4N0ZiX41BHg+IIasRon3v654ZJP+eMdgFmh6Ne7sThATM8upaBaQqp3TDBYw?=
 =?us-ascii?Q?mT93sTDLkkesByklH6cYo/YWX72h4aluQhYWYyXAkfIJLZ3yCCtb+dPMEoZ9?=
 =?us-ascii?Q?YpEk1KCp8mYDT0aHhSdL1TbEFfFC1njcpirhGcCAjmOU6Q6FMZflbF+3PFpb?=
 =?us-ascii?Q?pT1kcyRSVCmIB6NzuUbyduA7+PxmqVei4alXjljyFpRkH+0xbfp4xjUZ6Pr6?=
 =?us-ascii?Q?sR4nYP06VFyFewWs441C939UWjqPxn33/c/EhJ4lwsTO6Vjd5uHGEvQq4uJ+?=
 =?us-ascii?Q?cKz8jNkDRWbo5452NdFLu3/ky3An4g4pUd8FbSoTOhd3x0+mQ2KS37wdESRO?=
 =?us-ascii?Q?p9+XhnwPFlJfjEBW3Yi13XwAmuBUyeiOn6kecI7joVaHLPtbbKNEzgLsufdG?=
 =?us-ascii?Q?MNgtnorZMVsObyHehgujpR9vMcqU8z8/aJuQ16/4Keb8sZAIJA5THbba5qaT?=
 =?us-ascii?Q?bMBGpM9lxKjUCqGkTHx5Fyjs3De40A5AVf2FrNLypSmN?=
X-OriginatorOrg: siqol.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623e8d3f-28a6-4d4e-9315-08ddc907d49a
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2919.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:09:22.6752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e93cdbe6-5a59-4d5d-8570-7b6ea0400c3e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmyyUwPsMFyrIJt3FtQ/jL7FGjdO/83UOEBlAym4n9Iyq0FMbAxFUC6kiD2gIDlsjqGRsW8JuKF7SzXk3rzt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030934_362824_F593C63B 
X-CRM114-Status: GOOD (  15.20  )
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

This patch performs several code cleanups in the ixp4xx-npe driver to improve readability and better align with the kernel's coding style standards

The main changes include:
- Refactoring 'if' statements to separate assignments from the conditional check. This improves clarity and avoids potential confusion with the equality operator.
- Adjusting whitespace by adding spaces after the 'switch' keyword and within type casts.
- Removing unnecessary braces from a single-statement 'if' block.

No functional changes are introduced by this patch.

Reviewed-by: Manish Narani <manish.narani@siqol.com>

Signed-off-by: Darshan Rathod <darshan.rathod@siqol.com>
---
 drivers/soc/ixp4xx/ixp4xx-npe.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index 33e2e0366f19..d2494310ffd9 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -466,7 +466,7 @@ int npe_recv_message(struct npe *npe, void *msg, const char *what)
 		}
 	}
 
-	switch(cnt) {
+	switch (cnt) {
 	case 1:
 		debug_msg(npe, "Received [%08X]\n", recv[0]);
 		break;
@@ -491,9 +491,12 @@ int npe_send_recv_message(struct npe *npe, void *msg, const char *what)
 	int result;
 	u32 *send = msg, recv[2];
 
-	if ((result = npe_send_message(npe, msg, what)) != 0)
+	result = npe_send_message(npe, msg, what);
+	if (result != 0)
 		return result;
-	if ((result = npe_recv_message(npe, recv, what)) != 0)
+
+	result = npe_recv_message(npe, recv, what);
+	if (result != 0)
 		return result;
 
 	if ((recv[0] != send[0]) || (recv[1] != send[1])) {
@@ -533,7 +536,8 @@ int npe_load_firmware(struct npe *npe, const char *name, struct device *dev)
 	int i, j, err, data_size, instr_size, blocks, table_end;
 	u32 cmd;
 
-	if ((err = request_firmware(&fw_entry, name, dev)) != 0)
+	err = request_firmware(&fw_entry, name, dev);
+	if (err != 0)
 		return err;
 
 	err = -EINVAL;
@@ -541,7 +545,7 @@ int npe_load_firmware(struct npe *npe, const char *name, struct device *dev)
 		print_npe(KERN_ERR, npe, "incomplete firmware file\n");
 		goto err;
 	}
-	image = (struct dl_image*)fw_entry->data;
+	image = (struct dl_image *)fw_entry->data;
 
 #if DEBUG_FW
 	print_npe(KERN_DEBUG, npe, "firmware: %08X %08X %08X (0x%X bytes)\n",
@@ -624,7 +628,7 @@ int npe_load_firmware(struct npe *npe, const char *name, struct device *dev)
 			goto err;
 		}
 
-		cb = (struct dl_codeblock*)&image->data[blk->offset];
+		cb = (struct dl_codeblock *)&image->data[blk->offset];
 		if (blk->type == FW_BLOCK_TYPE_INSTR) {
 			if (cb->npe_addr + cb->size > instr_size)
 				goto too_big;
@@ -741,15 +745,14 @@ static void ixp4xx_npe_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < NPE_COUNT; i++)
-		if (npe_tab[i].regs) {
+		if (npe_tab[i].regs)
 			npe_reset(&npe_tab[i]);
-		}
 }
 
 static const struct of_device_id ixp4xx_npe_of_match[] = {
 	{
 		.compatible = "intel,ixp4xx-network-processing-engine",
-        },
+	},
 	{},
 };
 
-- 
2.25.1


