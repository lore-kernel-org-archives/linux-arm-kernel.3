Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02683E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=; b=DIb8qUZ5KV/dptFb+Akee1O3WM
	IT+7Zvt+ED4ddaOIYVgTAuPPGQ2wLQaYGvyeBcJ79PcIJvHXraPTxSsNaD12RijyaZByhLd4fcKap
	XjCcnTpNofA803/g+ZGcnSTcUfV7LA15MjqtYTXDeZOJA/DPRiyEUwyYfFanGWFAugmX/dr05zc3B
	vpWNMUmo7w2dWlBy0NphWqAEX1xjmAXAIEppuLDWJQ+JgepN9a44mznRHl2pBislLRg8z1MyGpOjP
	QE78OHU/9gApFYGkkBqzIpe52W+MruOdtTN9ETef4AsViueBwmR7tXmrZnYJDXJCFsrwVfpvc6Vq8
	7b2pqK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnd-0000000HSNc-1uY0;
	Mon, 23 Feb 2026 09:00:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnR-0000000HSFJ-1BeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N72kbx651253
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=; b=NqVMtq+twfczC/sc
	BwttqQQL5StjbFbLr//QuB0+TOJut7qV/VQB+NBMZkjtTVI4sbR0Il1x+OMAg7mv
	IoJVxVj0pMUHqSURupsBor9GQry7DNDOWmuK03xVzsY7aQ0sQvnoCvOFZGxLE9Yo
	DwZ9crgcdLy50eAkmTPD0YRUKjOhMwEyTfiZHFGAW0iHO3XSTcuTTBwzI9itV3/T
	wtILadGgeCeEKCEBI6PPyq+42q/PcWIhtK6THciR/yg7gxBcKLv0Ti99TNu6lndh
	LDlHEiwWLSYBk4mDdsDcnsffWyTE1LXANwO1zZTUY4978bHcQE8/vcsLsUpx4rk5
	VqG0Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so4603680185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837204; x=1772442004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=MykJTmNgOuXej4NpSliHkjftdou3mD7m05VJRItHi4tdc+zkKNmNKUFA7oTOL6uMzn
         HrgG4aN8wWKgqYL9EDVCaqQ6zZ3z82g8af/tgtzSOajZtH+aZydrvkUbI1EhQeRbNSNV
         f0X48QUpKdFYAAEFVlvRAjtCrO2suv1vi1LqFXar86nZ1QSSzRu1wOwZoSLni9C/nyEV
         cbfBzOZqHdnyTsuHEPrIKVI8p1gD+tmkSMk3zIEH9dGKlqTvp+0Vvy4qEyPwUiAVTFqh
         G9M5oCuJLnnaCMEaXedECuDJru+KRmDt1hnDh7IsYdZItNCLU/tdBw67WHuRX6SMX012
         35Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837204; x=1772442004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=wFhsvtyu7tWJFz0Badz6ENxCMHaM+5UJPyLa41kc7r3gEcHsZ3X0YVMp+THVfrnlq7
         NecAe0Vfw1I5TdXIvQrpCLzYkAoH5f81ASWWH5LJQx35bCngnwG9U7fOSz8gQKnPnIIk
         SZfRYXUqK4YoNVdpnewYwiK4w1Z8Lm0eizS7GEIutxcGqGim4ogxbL7VoFRJktKLHBOu
         2TRcheLu9wDpBQqm7DEaBfiWJpNOgLbKD4kHZqxk3r1VUqFZmqinYW8zjdh35L1XCAgW
         +Hecz7LwMe4P36xCS9WLNLzkdfPLWf1FW/VnErsJIfV2rfrpLZ+jW+fLDLcdHsRkBEWp
         jv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1CLpzk8sPUykKF5nt65dJAZO/dY2fRbLaB7JjumnVFdrpLpFTMjVZTzbvASTw6PIqHAp1o/tOTEnOhgx/IbcM@lists.infradead.org
X-Gm-Message-State: AOJu0YwInK7Z2MFFmGmxJgeIhDCmzgValc7bgiAI69qM9LJtPPYELVBX
	3r6IGEiHU9a4b+C7+1Gc0yeUw9fThxxcyE49ALnr+k2HPw/C0w5lWMu1WJ/RnIZCHxuXqa9y3Qt
	QSvGShYViEtwtVA0MQzaKqR3ghLEXmKZ0RxKvcEWUb3sHn1nnTV+CsYTI+IEO1gXjKJ63qf4Bj0
	kXCQ==
X-Gm-Gg: AZuq6aIFC8NcwUbE7Y6zUIwJsa5RmqN3QmHa+4HQZaO3Eqek6VGlpPl3hMRe7vuXMz3
	yqFv3ALPrqyXonXVet4eIvH0VSRptoPaDvIZEoH+wjk3UBB1nDCWrQ2n9OdB1Gr3KHXc3D6mArq
	csVxQrFc4pyV7OsuGjunwYvkBNknVXiG2DwdCnsn/o1u3jnqN7cgpAUgLoGpzsASxCsjktfNf4E
	6aFsjw2SQY1kHZBRd/3/+AKjOWLmWE7kBHFCtoazCX0IL5MIRBTQ2spFcaYvj9aIVhGNUFHbXvs
	ufFxPNte+upC2i/GAPhf9vKuabr4omx9bT4G3/zBt4KxcZU7Q14+ZO7OS2BS+IQQCGGfdavxx3z
	9T8XsfoMpLMLukB6C72i9QqhTwF9ckr6IVV1qmEZQ4UM1hfmcp5Zh
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884735085a.45.1771837203922;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884729885a.45.1771837203404;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:33 +0100
Subject: [PATCH v2 04/13] i2c: mlxbf: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-4-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcAnPQSTaMLTTpvB+xaAFz/B8dcwj5+aqUFR
 iA84Gjv9H2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAAAKCRAFnS7L/zaE
 wyVMD/0SnjD8uJViNM3tDR3CtAnfjAe2U4Tf7D9+q0NnRBNoXRo8sg9cFIL6nR6WVpwvicqFXKD
 LBpoXfdHQMtJfC+b9ppqw5+DNYXMG1syx6rrkvpTGw5Dd0DK5EhAafdd9+VmVrktPCBLDLnzWbz
 jVpCHba/RMWLG+wQe+Bal9ZZxunBPXcvJuK/xmpkLd+JbvqHr34az4mxrCpDk7ZKsFIBs3pd+2m
 H+L63R6NlUKQPd8YKdxgzD489rrVNkNagWDEz2DMOXRANIPSlXLYZOQn9iYt3zu9Uo8h4Kg1l2V
 OewXYuZ63w0J08ozkHp55Vlfg/jqmpuBg0oifaxNc3t2zCFx5ykBJ/9f+Pb+aLPjPF671G+48B3
 g4L5GdCTdn1lypk6SK8jVYIwcTZEcvXPY9uYi9lgiA1mOn9w+iljoViNBJRtC6JAO7x//pW8DA8
 +PKSUINSOaw101BElBgFemtbN4N4879wZyEaY+RaXvwloqTnMrDnpmi+rcbTAoUXUbGMYWmkb1k
 8oqCYSA6I+bYfIAguWYtxgGUgqrxTir+Ky4rKJUijbzaf4RZ2Q0JE1/tssdWWLrFNGGHnIbLe1H
 x5Qr2wdSOwBaRH5NI5StZsRBmoGHGlkxiDzz5o/csfoCE54SK1XtUmhVRnLZxDcWdKs+9gEPBqp
 3zY9ucoq7jzm3xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1714 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX15ymlmQIKeP3
 tREkUnC6y778xybz+TrvevldCh7MBkjKY8U895wdhEGrTnjXZ5OuxXWFReMR5D6uOQGVpDIoHmj
 pzZ77eB57AkpOQrvOtx0WA308Ht14azXk0TLpQeXodoI0xdIAjCiu80mckcOlEHY8BRac0IJap9
 iydXLCILjht2ocwneUMeckj2nlmSCz0C2lwEMdHBN+9x1S6IksFtl6IKpZBIyZ524rRuMHXwZp4
 8iae1NpBBGDJFUPC7UAbr6KqHsx+NOlRMcQpZrGi+jUSxqffjgJ/Ql5lvvD3utv8vuqoZj2/9Uw
 Yq6KAj2uwkuIC0QBLMyu2rHZcZ7DQbg+rc+WxGpppmVEPddGcpBfI/v4zlzjC0WvCx0NUSSGHx+
 rmzZ094QibY8cxvCnwYhBcNi9YO1DVDlo6izTM0SurqHvvIU7usYT8w+FzR1vbCtF5vE6D/nwC5
 FD9AkHTDL8pQf3HZr+g==
X-Proofpoint-ORIG-GUID: GPuljQofNSEwJKi05ylFkklMkyncfWIk
X-Proofpoint-GUID: GPuljQofNSEwJKi05ylFkklMkyncfWIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010006_428710_AA571F1F 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 6c1cfe9ec8accefaa3f95424393953ff3b869ff6..1dac73002220920ab8f954b29fcc809c6451daa0 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2038,28 +2038,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2067,7 +2067,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2075,14 +2075,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2091,13 +2091,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


