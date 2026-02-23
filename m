Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2525E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=AcNZl94jcQUliA74tfwoJ5NnLn
	gW9qYgrhIuakmP1mnjnC5AJT7MaFDHvoppFSV4vXskVzUlaJEJCPUlkeK9qGYRilHMFDEnRifJQqb
	cxlFGN9NI2ChX01nbacFDWRDeSpBaRQIMfHdjwUJp4PBr6ehTWz83TKg4LU+DmyK0iG1a0WgrbtvT
	g76MndfEJBGS5HzdeBzWCkYqwhTT8GYlSexIDjxejP3tPtzYWuH2mnw19K0SGv9V1lBWgMkIJ+HY2
	eyeieWnq8qPTJozueBVy8JlfxegUlERMJRNQFGUn02KIw7QV080vFctvl56M/Q3mbScR0ojk1tftB
	qVsZgRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnq-0000000HSf5-3LgQ;
	Mon, 23 Feb 2026 09:00:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRne-0000000HSPX-3OKb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJiM602926616
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=TT0IGx/PYUI1U7Ol
	kdWhf4gjUtimZksuqySAj9PKyiTbtTW1gVg4VkaQbbvu9xGcv5SIHNqkRkMHepfV
	g7twqGAQFobRdgsd/cXNgsHNgJ/YA4LMf2SF37z32lOEexmghS6ezEygxKPmyKYE
	o1sTZMCkUOkGo5df+14DsjSRzobWFnYlsht+rmhLzKoq6i2wMQ15klzZYcVMrAwv
	p0PuF9056UXiFL0Rbj2/JtKRmJGxsc/VS6PNggCqAb00Xs1LizbuKFdja0LTtSl0
	adfUiqxpOgTLQbwuOEuohEAlh/zIbFumspXaXWFeqmMNO6tKwnqQDWHqZfj+9wNQ
	woHLVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk4079-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so6373921385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=JVuec/+pTGdJnBASsrl2SHT4UMywlqc8Xk9I4D2k4r9n9R3Mij35+cJNE0Y98H1bE7
         HuzDStiASU1VpCHUo6OnaQVbuKM6sgGu3zHOWBRfC38lX4+F7kUCvWyZjCmqZ38Qmrpm
         IPbiM/vJkJevXc9MeoPj927mAmI6P2xCaGPZ2ehiMwHw7dO6Z0/mOm9XFhnwY6DgrvBt
         7y3Af0nZMidfZduxwETHUWc49Mrrr8K1ialuy9PmTXbo5ZSIaBqVjRIi0f5hUe/An91s
         xjtMW5APTMSGJfjZljwv+DdinUnrm4xRSEW6NTvfw/VcvhVHc6UNzXJ+gA93A4DsgG0S
         gv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=mVbjMt36XkO8upKVIlCAKe4PwBPhnCXlLmxHkvxJK+IJKxuC1YIpRM6TyPnFxz4V7P
         lB1TJIXmnlxGINyXlbjWtl0vdQxynVOR6ecLPqUi26tKTbEIU5d+mIFRzYsjcCEZZPRv
         M/eNx05TII58HF+ZU1L+JZ+CnkN3UmWnnfyPp6sgo6oDQ2emk+5qs5Gy7yYACBmCOQfH
         MShYElXJ8Ly9AwEw7cvvAEWEhJnj7qh0dgwdzoFRydvk9K6wzVCQKZ3ZNhxWkOngaepl
         hCHui6EUczEQ2xXJxwzKc9thFgfHkt8NGOuOysOVgjbG4gUk62DdxsE7Z68wauHSaNz/
         eVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcfE+K8fSZQcmNGVomy+fjBcfLYhmLmtdu4vyDitIIAXpAOjYV+lDzH1lhqOt/NGzAr+M7AyGeG3slJJYuWTDl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9S4b85sCr00Az7rE5/RjBXHA+k3qqAOg2uMT+h/aQxyR1XI5A
	fVW+lPetYhmAS7BDHT+/wsIDS8wZLqu/rTti3UXLqOA8Hp9ivzgchVIdY/gsjiB1orD3AHyLZmW
	3FV5OrUIGE9VdCvMmLcVHyi9EOErPEuOjI9Y6Vc5RGm3OZDagTEpg6S7NURNuFsr978xyijKZuH
	X7Mg==
X-Gm-Gg: AZuq6aLxiBkDEC4n6+xv+Nj7M1bgnL4qAtGNg/uCywsl+BTvS82PICe70GIUWisFffY
	REbXYS/+u/Z7kaFYxtZkdyaOKJzmf7GRrqJOlAXsH+dVKFs86Kv13ryHiXPAWx/yjX2WI96k8QY
	DuHSMwSNTyHntnKQoTzvxB4GqVAUE+799i4m49BUdee6Atasr1ifIeOK8AXGL4vTp574W6aPwHx
	slHKGfTcldMrZV6RKiXy/BstBTkssj+UxJ2Joo/1jiIvcKkoAlItWdAij5jTSBcmZFCNuiJV7KP
	GVYtXGgVOV2b1KjE4nX8VKz/ti5/AWfPN9RfUsojoA23d3JUpmvYqsbw8jjFzmGSILoUHeT+iUU
	vGa+F1HNjy+84DMpHr2aeNQe67wS2MZFviIrGJ2hwYLK/kC4bx2MU
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946106285a.38.1771837217163;
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946099485a.38.1771837216730;
        Mon, 23 Feb 2026 01:00:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:39 +0100
Subject: [PATCH v2 10/13] i2c: owl: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-10-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcG0op/5Rmmcmy1LClzr9Cd5rvHSa2IOhyh+
 IHRW3jceAiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 w5oqEACL8mqyvJjis6Rfx0rOWs5khRMic3wAg6GrTXJNenvQou1AWcDbjBunSF26We1tgWQEmf7
 VRCVaQ/cWoy6LateYwLbZVzpk4XNFkbere/m43SlqDPwo5mWGAF7HmASiol/gc4AnJ6gGEic0Zk
 47TiKxSQ7+nj4p9k2Gjf1BALtw9qKgtTXgZIQkG2Mipxi1fV6I3KnMXvY9LLcSdSanBeW6wgYBF
 EN5KAfr8gi0sGkley7vLr0vlCaL9fJUw3wvnoxaGcjKZPIqbjPJAAbio28UP7cwtt1fv7nTw4qo
 MtkuZG76tz6CpvoLwK7i8qoNFOZMHmqKXVY5VwTVHUa6adviUk/UXcsECWHknfSL1o/F28QPipQ
 TOxHFbOj9KmIGFJ1/G6YiO54Z13GwZRCEBBXi+KYgh9e6Dg3XJ965Z589WrWaJO2Si1wCWxNTZK
 cBuTsMAuNvrbrkcZ8vFSM96OHqLs18szgWhcgb3nuLqXqd5YdBfpms2I6hsaz9DXxqnTGXoZSBM
 1vNqLs2epqXyzG6VlfibW6cEzyb+80lDvbacE7/aVxEjQjMS8k5LTMSKMIue8o/ZvU1Qs2Q0kmW
 eBqKRa5zfF7/AswvNJrigg31veDBrNwzhG/+0B6u8EH6op2DaYyv/l55F29zOnJkV5kC9vi8FKe
 EXKVEvxa6w8ktEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1722 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX0bw5U2Lbq8/s
 o2s6qVWc9SXcAsNa6yXz/W/7Ml6aJfkPgnYwyOz5JWlZTreBmxH3QR0FlUvpwp5qXMADp40NBTR
 eO4o2YVn1gyoxIRHX1fJZhZyylLtHG/NzO2iGD26UdIfCHBrMrDUzVkY1JR/mCCmk6zvTSuS+Sc
 mHsWuN3H9YDQwy3+MG6HCvJMFlBDhK6LcoIEDliUJJep5QXpKTjC3XBtJFk2qPVswrnqkAaHcvi
 0j1e2aG2nzimqJLUw1piEKvoEaKy9hKoTwXQC9eqbTyWqF5AAoorbnzlREeDf2PDWrTd+Fx9AkV
 E5bInqBD0QSU269QFY7RkXOgBcgDRBPEdB0Cs8zzjf0N06qEp6RSfeRRiydZ9lNzVx4qAAINh0Y
 Y7ZE97zcg9QGEsyfmwVPoF001gC8WwjxboDVuCrCB5cv8zTsMXtctZAg3ULEgE/Wf56aPxhCe4o
 46uOieev6QK/WCLhm3w==
X-Proofpoint-ORIG-GUID: s7wwy3qZ3mM1RX7bgRL9czcXJcI7mAYY
X-Proofpoint-GUID: s7wwy3qZ3mM1RX7bgRL9czcXJcI7mAYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010018_891967_D5C848D2 
X-CRM114-Status: GOOD (  15.45  )
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

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


