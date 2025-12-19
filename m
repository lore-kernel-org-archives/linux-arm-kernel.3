Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D54D767FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2sMzTB/9S9jACJVAZhu8V6NoQJ8NfstFRgn4YsuRPM=; b=xONhEYZPg5RXlW
	Ofxvbf7decE9Wp9NODzrkBa8l5t0cELxGGKSa8/mNXlQmhYgOl/vxy0gJS/eIkTmHzWRfkQFE1Y34
	1jf9IvnJYeywm123Pq9/hZ3EISgWswl29rn1P/YsB0uku6rR9nNWx1ESRkCndG1e1J7dSCMrnHCKV
	6eAkai+l/r7Nn6hIHoYmg1hN5X2LxjE7Fl0xmFvb0uxOAt7rV2oVqJDeh/gy9Fozm8Hj87jBg9MYi
	4MCrvWsyp0ggfBZNLcqC9WHFTzEXRvKdqUpShaXXYYazp7bgmq3R6YfOBp88P8rtY0UDRsDdgWSS1
	hYU+GDsXfj/P8X8YUL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMK-0000000AGQE-2sQn;
	Fri, 19 Dec 2025 12:13:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMH-0000000AGPZ-2dZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:13:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBlbOn3318932
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2sMzTB/9S9jACJVAZhu8V
	6NoQJ8NfstFRgn4YsuRPM=; b=ArDOwSQo+YqI3EHenFVl5aRXCnr4AXDFvS8idW
	YlO5MDSIwCePpkbUS8iBjxeEvlYlIkhLu0ZpUshwIKfqy7Lpa3FRhql9WuLWxtPZ
	if39TDV/R6vYHFhomHWqInc6l4Yd588k+9DzuTASCm4zMNB0NUeeDAhRqYy8NKHq
	iO0PkpiR+LDGinas2TuEDhQ654Z9MzPZIYhe2K1o/ATpCNF9Gnuu/FqAzHLr6z3G
	2dkagBsZssQUN+s82A2zxGTmvGxzxT2mdSTttZlLGqToDYr4OZrEZdzQyeu3afMK
	SbORA2cy6rwU4aDJ4LKaaF76qevNz7q1aWZgEi9h/St9k9AQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ethg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so38482321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146400; x=1766751200; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2sMzTB/9S9jACJVAZhu8V6NoQJ8NfstFRgn4YsuRPM=;
        b=DHSbPvOXdeKwzlQxad6D3ot7LYo/wVXEQD7DKL8fOMDwVczSAaPQn95eJ/zxwPBojt
         RAGO+4pf6gXb/mDiEoMB+wCGQwHiLcUdnpgMwZ9HKkliCS9EhbXdUK+x4dgeg+ptkSY3
         u6zYH6By3sYmvq505x1n2E/ptm14RhXIo9+0LpyPgYVobSqSpxf+gJdRsLZs9jhknCBb
         exhaZ1EWWhqncX0EQHrjBdW+6oGokFszQKkB7zPPnzLE+qWV62lywjDxiqMzNAlimWWx
         c9yIvwMVkKMsIWJbFzCyfqf8ehpiWpbxKZqbcvCq1ZQlw0G6Bbn8F3IksNJn6EC8D4Hi
         +yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146400; x=1766751200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2sMzTB/9S9jACJVAZhu8V6NoQJ8NfstFRgn4YsuRPM=;
        b=mMTXUosq5yVqEqFdB4pmMNichvUb32V+hYU51urBlbyVUn8zDg3cYVAlqAeI0uslHL
         c8ONr5Aon1ou80EqMES0DAVEMAXEk4lzrLBDw6xjZPcy7ThG6qtu19QVWLW5Ypn21wdc
         mRl8oMhoKJUO+gEYIROrgOQ3/jqNnyv82aFlcL/tU4wUlFyqPzEEGJ+YM+lQxMBBCQjM
         QAYh7P/WVNPaPXO+HVTprxu9sJcvkh3s96HMCiuuZ3sak4TqqgUqba6P9yPk/KdpCjO/
         xKEiZI/50QdHU9knwRo+lZnYtaDRGD54S/QktgSxYH4/z0F52Q6WC/fmrhZzrIKbYIqR
         vtqw==
X-Forwarded-Encrypted: i=1; AJvYcCUiYbQxv7KexFfdJcE2XQhH4gBWOi91NU5GY+N/lE6RxqA13vw0iO3ENjMNcMXfn9zxiefSbK6tqv1KP5n9GLeJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjeFq/ooagH65+rEgFScwE0LuM5oRqDiLcu4b1lWevEyHfHarJ
	dGwcpEROXh/kgys3+xau2L4RdiHAQ+WZs7SA12Ezk+iBloC8noOmQzb1oJJkjN3FtcLJHm6UafT
	oZFvWqiJ6rZdVjByOGCcVWLiAi7EoMChvEgJOUkUuemQ7FeQhclhkFkcEIpJjEeozhnRdt8fyCg
	Wb5Q==
X-Gm-Gg: AY/fxX6sli9PcL3zVRpDdsbfo/oVdifq1YVl0ygfTYcaNo/Gxm/u0LwPDozUngJgl2p
	ry0DiEYE60o9K4q0sEND94KtMRzIjLZ0KbKvAsjeRm05kA+nOUL8pX1su8iFUDm2THGPmj+zUyT
	VGNU8+QKNSy4Ei8I9mAt8mt2Y9tH3ZXMZQhfEEl80Li6N55AIftT/IRDdv35+q5S2SFRGVuXZuq
	5sAcpPJ9SkWs+tiSxsRTKJFefJ8tdksObtmQMqEj+3GDTs1t9x8DRPvtfqj5vtHusvFW5sjSKLB
	Xmwf2zPgr7K4E4TBKSRjyztW+OZ4r8rt6+vfEq+5eD6Pd5oSU266VaEBrjz33KP6YnLk5+hjVAI
	UC1Y6Jr/kQjcI7x/gHyq3kpV9XevgHQ7UNzXfHPhf6sxdyk34t0RetiZSqYP8tolCZWOV
X-Received: by 2002:a05:622a:2610:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4f4abde3adbmr36403131cf.83.1766146400061;
        Fri, 19 Dec 2025 04:13:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERo/Ph6jiM+hTOtV2Dbe7tgk55zLTZeLf6OTGFkErFMueI5t7pnJZbd6eZydQNrO7sGnAu6Q==
X-Received: by 2002:a05:622a:2610:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4f4abde3adbmr36402541cf.83.1766146399533;
        Fri, 19 Dec 2025 04:13:19 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] gpio: Simplify with device_get_match_data()
Date: Fri, 19 Dec 2025 13:13:11 +0100
Message-Id: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdBRWkC/3WMwQqDMBAFf6XsuZFsYiztyf8oHuIaNaDGJja0i
 P/e6KVQ6OXBPJhZIRhvTYDbaQVvog3WTQnk+QTU66kzzDaJQXChEHnButk65lo26oV6JmQtcmq
 alhcSkjN709rX0btXiXsbFuffRz7i/v4rRWScKU4XRKV5rkw52El7lznfwZ6K4qsLvP7qYtepU
 FTXCqWm0oWQPZ56IDeOWRqotm37ALnb/DfwAAAA
X-Change-ID: 20251106-gpio-of-match-23b24cddf063
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o9Jv/NWCSX0lI1ltggb7kobdggWkS+H54pSOi5S7iDA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFaRqV/DUlMw8fX+TWIjWGlMWLDl+PLXbJWM
 PI8W6v81kOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBWgAKCRDBN2bmhouD
 1wHSD/4laLKLg1mpSVorDo7erTjdp2WHh38g0Vj0eIyj24YNgOJdUk0qoUTsKrCB0nY6WINjASI
 CAGRWtIt1WrGc3bOyeBHMGG+dtZVvlg6kWZCoPJVhQ2IJqHV/qA8tp2uCmbIhOVe3lcPli7HwJX
 kPa98jcYg4jRCh+icpj2vcsxhV28Xq/NYvK2XV1Q5hN7JqUIbK/V70ai7Et9lFdA0RxswBfknxk
 hti/IbEXwBlS29fnehogQ3qbFEG8h3Dj872idkVkje8t+WL5T7/Q+gb+SlvTHQa4qTzdBaNbRYo
 w0XchMTB6ZWlvlxGWxy5QwLAVhYbyH0raZM1S0tTLjZEvvVc3IVNshMXJ9w0ZIkqYOxs+1HhHcL
 WrrRfpUvz3eH5+/PWk7au0E23m4XULDvTb3LgU+5Xdcbk2YTh+5QIZQrpkZwvFcBpd3TWXb+Okg
 Mfibq375CJGIHEoJkORfMstfHKI0hIEGr2VK4q5O44Ui4120w0pKBDun4IHp8z9nTUr14UcbnxF
 kTUW45m8bkrDt4Uui9xMgLJHCYmrlUt2Q/Oe0nKNTcoda6M2D0z++AgnP+wCR7uBAvHy4ldTOEJ
 f1qVGoKqbvBkKBbQ/V+EvEg6jQLj+EGQAOFVORKS1EYQQvj1IFwxZZ6lXxtgQ4SDuh06alQRmus
 ZPG4JowMyTN4Dxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: gcUSmJj4VqP1NtPnF-VDq22I0G7mQpIa
X-Proofpoint-ORIG-GUID: gcUSmJj4VqP1NtPnF-VDq22I0G7mQpIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfXwKJ6Og1WlgTM
 1++y0XGQOjDiembu7HB1VwmIiC56MiqWFkyWsR0MCmcVSnSgIC1SMR6s7shFfCcxbPZhrBOWj8H
 0gpIdTBb2fIBJsm1nYKxxIjthGKMSsQ2cClrcWjNkTt0IBkVzO3PAlDJ+RLOBUuRdf3Wpv/SYLI
 lUHpvFGT89zmMY4WxigBcS4Mp1lX8PRVk3pJNaebNRkher51LzImOY/7kiW9L2d0lFxkHCZZodH
 cszkzGgr3Uba2bUUDkIEK+peVTP1Stn4gCSVZ6+FtUwrQZzzfLlmSxBJ6YzyrhM3q/EoPr2piMy
 3v9ek1922nnTMTF5pokJIVHZfPtK/JGLP27+aOfQzidYSIlqYN971agDgdyKVxHqSte6goFPgGB
 WUfLNXH6xYdDRty48UmtX3BVJA4pRq6tM1YAw7CJhOZFbhFB1dCVEEVWVg/k080OXgq5YYbPe1h
 EjCf6wZfIxg2W2z2E7g==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69454160 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=g6xpqFGyBtyTyoyyarcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041321_798631_5D11A3DC 
X-CRM114-Status: GOOD (  11.32  )
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

Changes in v3:
- Fix subjects and commit msg -> device_get_match_data
- Patch #3: Use dev_err_probe
- Link to v2: https://patch.msgid.link/20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com

Changes in v2:
- Drop applied patch
- Use device_get_match_data() as suggested by Bartosz
- Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'pdev->dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      gpio: aspeed: Simplify with device_get_match_data()
      gpio: creg-snps: Simplify with device_get_match_data()
      gpio: zynq: Simplify with device_get_match_data()

 drivers/gpio/gpio-aspeed.c    |  7 ++-----
 drivers/gpio/gpio-creg-snps.c |  4 +---
 drivers/gpio/gpio-zynq.c      | 12 +++++-------
 3 files changed, 8 insertions(+), 15 deletions(-)
---
base-commit: 26ac2c4153a2c543a4ef3dee421b46bedb0f8f0f
change-id: 20251106-gpio-of-match-23b24cddf063

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


