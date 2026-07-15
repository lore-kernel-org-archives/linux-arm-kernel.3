Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBCEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ICzZc/YREcWG8yRzvtTOygbg4tYykMDquevJH1bhvQ=; b=DLZNTdITxQMeSqPnhbipOjO3k9
	hwINiRBZ9UenZkAC2IACzDjLAmwyQ3bpxvY5+bisspHep4J5blgSghwPW1XU0MlT293MxDptMWMBi
	XJ5jmgV8w+XZS6f4D8QhYNaFwu0PzseQ6iYAaNPcnWS48SKXd+ZNeZudnIKdULtqaEQJl1kXAARYt
	JRp9sAMbvOsGob8sTkrFRPuH3SnXaxRKBE1Q+RjRJm+Zy3Htv9JfV/peTPfO9sjdVIuK9GKPyu8UI
	PnV0FqbhNkBVnCzAjtMrTwRCUqg1qFc/OqK3lukTo0bRRelhQrGnNe4ha/4kIEUYsQUALigBvLyYI
	w209vFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk014-0000000EzrX-3Clb;
	Wed, 15 Jul 2026 13:51:14 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk00y-0000000EzoJ-23zA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDj81cqeWCDEf2XYA51S4CrM3xYuApMDaxj+0tS2+qfKmBel6dYODLMmdzJveG3XGubBpjlxXyUItS26VrLJX2mZhTjGf7DgMES7UDDRnA0N39/0sx10pUR7+KTOnyS7bmXAXb2jYQv0aw8pIK4JwVftVEQlEomS9o4jbYAiYsx+8XsukPaz8x2sR7TEgcxn8MSO20XDiGiU1AsXSQLB4HSJv/D7vbEYC+AlIKb5uYL+sbpI4SQw/uktBsmt4ycIHciuN29QUsfJnJWoM2x6pwnuXU2caNgZ75ADEcBeKuu33QtyKeLid1M0DTeNXYH04UxOSney1/sGKwCQrD1H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ICzZc/YREcWG8yRzvtTOygbg4tYykMDquevJH1bhvQ=;
 b=p6kTJjAqRG+eba8osRUgpJ7zARh5eq6+82XmBBtUCItE+dtTwTS1xHuZaH7D0JcWRoF6ndfL35nZ0IqF6TSR0zpoSNE5GmnJcO107c3odclMmTdetyPSRq/WdFDI6WH9JDrAJvuI5ikBdavyKOrWEyQFDhsDgklXtvL0R9j0QQTSYKgGIbLmDblNW3CAaZtc7OnZZilu7SQ69MjP1NV8KCfw1AgIiq0q2tkiZJ9qvHv40dDCevfH0A4hBEdVJVXK9V9A8DvCInoa7Wf2ZqzbkZfMilb+mPVSHSzMa2Xq9MH6RLJLawjM+AjEsg6koeK7AbVTSyf2uPGuXtqZvSgshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ICzZc/YREcWG8yRzvtTOygbg4tYykMDquevJH1bhvQ=;
 b=ggHhQvqDSZI/Ha58OClDPWD6lfJJh1vfAaXrhnAOePkYiSA4szsnREsfUMk716pBTgpb1YwSYaX/pETV+6TPJNeT07CgZ3/RKDMEgDQc/IukTuBeIEGiB27GFNOQu4yhn2iJ4dNo7L7mAca6q8KSJyg3Xloq8N4OPrMr6/rYjOlvDIgsbbP0DLm88wlgU/faTRNy+TF7IP8MVDgMjQgZTdSwS/E/xTBiR+hIMUoiroS9n9NA+ohMrkbamDMbCk+NafYCKBtoOGg4E2O76XF8KhjjEsVp32FXnTFgjoV/z6r/odpfUNcoQsc/xHJQKVLpEFw11A331IerV92XWhu/9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8658.apcprd06.prod.outlook.com (2603:1096:4:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 13:50:46 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:50:46 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org (open list:COUNTER SUBSYSTEM),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 1/3] counter: stm32-timer-cnt: Remove redundant dev_err()
Date: Wed, 15 Jul 2026 21:50:28 +0800
Message-Id: <20260715135030.326290-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715135030.326290-1-panchuang@vivo.com>
References: <20260715135030.326290-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 39066560-fadd-453b-a272-08dee278121b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|56012099006|11063799006|38350700014|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /rPtsrvo9Mg1GsMEX06X9uYgBdU17S/jM0TAIerDm/6eJ/5JGq+81kXHvfVrEjXvDKXhPls95fKCbqr1ryYg9N5FsYAj/VPTg6G0wCC9s6dX/CdqTC72PeZf7on8W7H7Gxn8OvBO+pivYT9A59RVAkYBKIVKHVV1nI1z4DNFmXsG76Mk9alKI6DRpvmfuOH0Jts8+U1f1gF2hq4DMdgL4t6pNnsrT0mmDIy767RHuXt26AAxwVCaB0ZNs35sHUYP9ztqCOphJSp/t04kq+jqyULImXF3N2GEYcWwEk+1sZgad3tee2aw8BzHjfBSIvlfF9lWkcSUAJiA1OZwUL2irxXgq60/D3yUatvuYN7MosrN02Bk97Wa/s4FujM6mxzg1WUPs+mTaD85ovjGi8l4RgzoVAtXTCRpLv8S8omuBMaP/RF0r+MjoAfL/zzEVUWnGpFIlyRideAawzFkGBytpVo7/annIeoHWQozO/Ub1LAgs2EyUaGlFYEjEwqsPaxLWUOiZMqDhSTW3vv/QLZqZ95or6LKLqNQpqGXoz9sxa/7DeYNkAJmj/Gcgloi4T9OKGUFuqp3Jdd6FgalACCL7IG3YuPtYVlc7cC41g79fDmvpIb1NhCnS1kugu12JbevSjrIY4EflaQTI4LNhTtgPtQRrODvvswYn87zDXKhrETpNBZnQDwRgr63GiwYyv5cNAhjeHoo27v11OvpJ5esWDHADHhZ99yg3uTYAsSESZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(56012099006)(11063799006)(38350700014)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XmipqyrTDzGjdun0xi/YOwEqklRkuOKMjMmvmawezFmLX29kHlD5taDrVDKh?=
 =?us-ascii?Q?qIQKija64GX4dv89gC042r5dee8FRNhwi3t1ayVmIrE97ur/iskPaoN8WQJN?=
 =?us-ascii?Q?QGbw3LEPk4rNO4GqGEnl/5oR0DMI1E9YmgGOMI6AXW0uv9xLRSd2bPGk7Y2W?=
 =?us-ascii?Q?mXE59gvkodADLeb5yPyZWyuh2PGH+Ya2GC5TUBxBRuQ0gnEmqT96IcxwLfOE?=
 =?us-ascii?Q?SOyciD4vLdzU/1Q1kMrPxYs6MbmsPJaqn5Gp+Qd4J0i1dJKmhxPcoFZuWdRP?=
 =?us-ascii?Q?7h/8ycgYJAdp6yWbtZHAYPE5Y9/XqrmQJqAELXUgDlYlcsGEYmX6QnyAqXnR?=
 =?us-ascii?Q?/AAivAO1f1PCnfiYpD02GdzFPG2WfiVze7AQExRqet6uRl252HujS7WvW9Dt?=
 =?us-ascii?Q?7ognBaNYH7qayJUcdAHmzem5+r/LU+6ghJ0CqOJFAGCy0hWmmev8YUAtNDch?=
 =?us-ascii?Q?bDP4HIPLNB8CjaqG9+bagfGHy9hCiAym06cq+iM4oUFAxaNZ/6oF+JX3t0lO?=
 =?us-ascii?Q?0RU3bF9MOo8/R6PX9vatewvamfx2pnthG5dXF7tXyvkSf+4GvFgwETOJTsC7?=
 =?us-ascii?Q?srESeqYBjvc04Oj8IbccQpuhBUU2CMjtf3hLMWp9tpSgz+LaCyaUWNwv/P4C?=
 =?us-ascii?Q?SyHg5J2GWn0XDcVfd7X/A8rZLED+X3LyDMUXw2T1yEzKki4KDn0ePTSCORQZ?=
 =?us-ascii?Q?J/qx/rTm9zz3TCIQ2sDRq55xZ4mVKJ0Mv6dZxAp9HytAoHOcy1ByNtiT8qs5?=
 =?us-ascii?Q?fC0r4Nc8K4xvmW7FUY6fdMWSSXlUjq6YR05g5+nZgU4dKf2/Lz3bP3FlGVOk?=
 =?us-ascii?Q?fZ4TGno/3W110KZS5+gNkpdzXl9Tq3Z6WzxJEPusVlRHvzqEyfpKtND6e5Zi?=
 =?us-ascii?Q?xwKYY3b1Vn6BLEWKuRgeFi1zvsZXrt3tIQbA+VSIkRHXPvUCSkC5Z27tJ+9/?=
 =?us-ascii?Q?wyvDJmJpt8ZgX3GY6dhKBYFJybbcslDZZZmhVXlZK7t70D6n/PpM/BRfbhny?=
 =?us-ascii?Q?g3Llb0n3GxH+ocUOtltkb99Xa0EcJoXMnzuiqRzh4pZghOL9vayV2aakjYt7?=
 =?us-ascii?Q?Ge+aXRbyQA/rC3WRK4+N/dv5vLGrjSePagW5xA5LqjMQKBqiQy1piHwOgNgD?=
 =?us-ascii?Q?IVGbk00xn1GFw9KLP/NsW5XGfGlA+CUM2zJq4rHsvpUl2+L+t9AX/74nhhSA?=
 =?us-ascii?Q?+6haLiil05FzXZM2JfaP2VLhHhUe7y2SvTDHmWYCa16jXBvnClapMefZzfcX?=
 =?us-ascii?Q?Rndgp4lA+NbcyaXeRPPbAFh5uK05fU2RhhkaMoPxz0MkganvcH0hemzTDGvZ?=
 =?us-ascii?Q?pVrJB8d2OFbCu7AlYQQW/mfT39ovBZ37JfjLMaPSaNdbGOx6QYvoQQeOsDER?=
 =?us-ascii?Q?AVcOJsGovO/d8xDiC97BW75RjvNvxU0QRuR++PvAIVhBt5WqkueioQvRrvP6?=
 =?us-ascii?Q?/uigzhzcxA9DRmPCUlaNJAhp5oGX6lGHp1sKuNIbjvAZFSWJWIbiOIgA9ley?=
 =?us-ascii?Q?ZelkR+qgbrNiKQmJMtYIxTcFrIbbHo/obOJy0mii0MTHrEpw3SLUaPSEJmuI?=
 =?us-ascii?Q?Q7/Al4ij9gq8yjhdd6olOrcYD5xOqGCQn1ZwlLj45F9UooXUKR96MT3jyKp5?=
 =?us-ascii?Q?pS0hYiSmkDS8OpOOZk31Jnb+XUKSQvxLr9Th3sxXVGrWnwMSyAxgFKiJFnaQ?=
 =?us-ascii?Q?cxelj/BAu/lo+ayfzZ59diNnDKi393vm2ec1qP3CRI5Vv9E46o1u0nAINiGa?=
 =?us-ascii?Q?dynTWyAqKA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39066560-fadd-453b-a272-08dee278121b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:50:46.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crcTOXXneEpSlvYfXsUEWcQO3qgrtWgoniWXMbIA3TGmAlS2Vh7m3ZBUNqN3Y2xa8mjZc1f4oWyB79zJk6fYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065108_536521_FDAAF4AB 
X-CRM114-Status: GOOD (  11.55  )
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

devm_request_irq() automatically logs detailed error messages on
failure. Remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index a3d8f7a5874e..9eee281350d0 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -759,11 +759,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 		/* All events reported through the global interrupt */
 		ret = devm_request_irq(&pdev->dev, ddata->irq[0], stm32_timer_cnt_isr,
 				       0, dev_name(dev), counter);
-		if (ret) {
-			dev_err(dev, "Failed to request irq %d (err %d)\n",
-				ddata->irq[0], ret);
+		if (ret)
 			return ret;
-		}
 	} else {
 		for (i = 0; i < priv->nr_irqs; i++) {
 			/*
@@ -775,11 +772,8 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
 
 			ret = devm_request_irq(&pdev->dev, ddata->irq[i], stm32_timer_cnt_isr,
 					       0, dev_name(dev), counter);
-			if (ret) {
-				dev_err(dev, "Failed to request irq %d (err %d)\n",
-					ddata->irq[i], ret);
+			if (ret)
 				return ret;
-			}
 		}
 	}
 
-- 
2.34.1


