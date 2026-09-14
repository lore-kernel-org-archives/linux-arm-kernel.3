Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44120C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3VwgneHH/rWpuPJKdEurXtnPpT2xnItEnNcDucOK8k=; b=QLXIjZBDR8omDO
	HwBDKTAytL6LoqffGKHRKHLQw5pb3Vbj2Fqg7jeCK5umKsCuIrzJZ9libVMC3M/00toP4Ws1CKj73
	e8Tt4oM2zizHwLCVWt2j3w8dEXrZxMhCEB0y2P1tKx8c+nFfj3G/IECkeb/Uq/X8gRlKprRqiDmFA
	v0mwxbuaxsICubnZWPWjhtuShJuc2/rwyrMYxk4G96XKXr7X810U8OaQDwcFmAtRdzxfltAXmtaNC
	MB6ZRiYQa0AjPl+fHNMq3z/zZkTnGxi8MZhc1xKlQa8qDF3cfmKJvB/Czf0UPg8UjEYwJipIVws2+
	7zV8w6dfSwbVElvOhyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QM-00000002Sz5-3MXZ;
	Mon, 14 Sep 2026 06:44:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60QK-00000002Syj-274f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:44:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4l9063678
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3VwgneHH/rWpuPJKdEurX
	tnPpT2xnItEnNcDucOK8k=; b=Q3UvdQEARWayoePybyNiUthloz/XXIq//Cx40r
	wwBMAQWF0FVTC3t7P5zgJqfzTkET6pyw5DAwk/jQLknyNlrVbwerIZg7/a8cICdT
	sjRPVzUKyx+kYSdjMxTn6wUn7QtD8tOfID/vtYgqDnJTycyEkoWaCLvp24Rp4JNS
	yjUQy0805FR+ythqZYNB3VYaNKsJbXLes+t4XWFfrw+SziEszQWgKuXuJyh0Izd1
	EyyXnygVW1upmdgXNRShmxGWPukFCjoxqfXg+NoIuvTl8BUiYiM9nM05Td63cp6+
	Selii3QFpZq2CQPK4NCAfQzjkf/k5cbXyFnAxS/YtF69tSzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dne3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so174196385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368255; x=1789973055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q3VwgneHH/rWpuPJKdEurXtnPpT2xnItEnNcDucOK8k=;
        b=EGt/IR4v7svFULXGkjtb65dn4k9AZL1TgvoE8bBeNYM2i2QKUUx9Fb782Py++gfsKK
         iN7917vvb1Mmm6XQIJuEwTqdfCgNCV+pt9qvHET3prkPmF3FVQ3chGSwEq8Z/YOxckhL
         rTVwcvpP5TAXC+NFELLAduweXAIsxNnqLFC/tWDh4ApRQFdAx2LeWIA1gDUtX/w3+YSn
         NJIXsM6ubhqlQVup8Zmu9pvFLEx14t8SEudgyOEiBuzP3sYoUEU3WhWD/W87onyHJNLG
         IbKJU/1vdckh7lt3zNkCYVhcnbZX2vGwm5qOO+Q5TDTiFgm/hKSWc8XJm/1eyiYKHZMF
         +yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368255; x=1789973055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3VwgneHH/rWpuPJKdEurXtnPpT2xnItEnNcDucOK8k=;
        b=Fypo0HJlVPpTpcDG44/jg0LqJ17bdjdOPv4rJ3FUON3gmqapVcrihkVDtGYdVow5Pj
         efgOVq7bqQwb1vO0HZemODRJUsUqrkwAIXMV7W3iYE+JB0Df47qMKF9OmnyEUrqRmbUP
         18BYEuPDKpghboiQKKVox5lKK1SCfDD9rZ9SKKJLkJSqUBFF2xJPIQg9h7M2tYnCfaRg
         F96dAlsqz29mD00N5dHW8Xm9DYivHZgUu3ijh8iClQdujIzUHP2HTvdy0OCOWdrciyqe
         FJUvKYz9ckGvQ6X7Yhklr8IJMJR2He07Ultbg9PepeLkD2hZcfbwEWVKUd2LQVAkTixX
         HyDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHwehyvHWgC7AgY6iBxWiTllo5l3ULQ2fTg6BcCz2n98KAB69TGxLlVlrVqgWV7Ebnbjk83WataAJUKaTdXdFQ@lists.infradead.org
X-Gm-Message-State: AFuF++kfywVAD1KEAdWFpdY3S2t4AAQj/epU+rjC6TwOsDB82rf99OCZ
	PyZCrOYlbHG18/kQojYT0vY6up7jCaPdTQbT4EDxF3+KmQ8jJr92yMAEYsW5qMHzBU47+aSyBNo
	4LNwUOE1gwSXOdWlVmG4kYL7gqb4hjiSSK/z4cnm04n9gLWyeFNwV8+uodkDLpwUe7By5BbK0dX
	GxxwFoXGAvsg==
X-Gm-Gg: AYBFou2zZzLe9SnTDQtXmPI1rNQ8Mm7U0Y5Nk5MT6yhlmZGkEhstO/tjuP4enaHB527
	bOPBKGZOHyCE3crgTxMtt9I5yYwq6c04C5YD8LMdYG3T+wli/jkCBfg8NaPpUxkTlq2hHntDzwi
	tAsU1BQu2lLY17mVqdq9XZWxWUmOUzOhGzSywa+/qefe/89ujNfa4F34kdJLvUitsy1bFCgKLAX
	qCKu2pMbQvSa5hEuRYasZIsEOQ+D0s2r6ssoQfX2alr1i8cFDgfaOQPmbUmcSci/QzZPXVdLVWo
	uBVY0FLua3YnjOw7oUJU0HvxOe37fqZK9ZFr7eAdHhfOkry1+bjppAjtsLzUgJh7vvsk2giYy5e
	9jSftVudsTyRtlD9tbx+rryM=
X-Received: by 2002:a05:620a:8081:b0:92e:541e:632b with SMTP id af79cd13be357-93a2973d12fmr196484085a.2.1789368254926;
        Sun, 13 Sep 2026 23:44:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:92e:541e:632b with SMTP id af79cd13be357-93a2973d12fmr196481785a.2.1789368254453;
        Sun, 13 Sep 2026 23:44:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm23736954f8f.35.2026.09.13.23.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Date: Mon, 14 Sep 2026 08:44:03 +0200
Message-Id: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oza7CIBAF4FcxrMUU6J+ufI+buxjgqBgLFmpzb
 0zfXaoLNxrdTHKSM9/MlSVEh8Q2iyuLGF1ywedQLhfMHMjvwZ3NmclC1kUpW+78gGiC9zAD703
 ouDmBPKfY1SUnGEskUCmhWTbOETv3d/d/fh85XfQx787o3Di4NIT4f39gFHPv21uj4AVHrY3aN
 a2SVm9DSqv+Qqfc7FZ5sPnkKJ9oJapPqMwoWUCbRlXr2r5B1RNtZPEJVRldlxIt0EBbeoFO03Q
 DRK+/K40BAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PVsMwaNVpZd4UiWHqxTTws5LFW4YyUdvehtqzhFsSL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqp5e3XUKEdpklYVPyX4YhJsTH0XW1kqsPtqwsw
 v6d9wWinBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqeXtwAKCRDBN2bmhouD
 179fD/4yaUDPB5yPXczOLrAhAfwuQOReVZ7J/ETEAmeKvmEsZn1BGhrNUUgrbI9Xh5x3VnL0MC4
 yE7wQkgPaIl2yB8jJcvQRI0MgxGX33Aorp5M5iGhyN3ZJjM2POjzO+bzZeNQcMWQVEmXVvK3GXP
 WwRb42ZTH4DuhoEjWfS4NoqHlRPWBR04yelX/1LLM839lmDCkSid7HGYO6JdlkodveOn3wxBz2/
 DWxGMNlYQsuoeVudBinUncv3w0QZurLOE+bsyfTR6KcN2rWeYMEWB1FgCI0gj7fOXnXD/zfXKdD
 YvTBocqbclU3J5u/MAcyjGs5nGf4aGFKASP0RDh7TU5nsIdpNZk08VFyW087d1Vh0FMbN1f4m/Z
 WzFHcfIrj1lSygxb6CzWt/Xy2h+C8/fXXk/hh+JvM9uuKEWxcFDjviaRHb9811xWuLn8SOzawmp
 rQwfbSRPzPiKdQxXTL0/ZeRczTVrmxszDIxFrEUu1p4Ts/Mwx09utIo3DYkifo8Os+ArJFuJVlD
 zrLpP7AoVD8xb8pBuDspxFKCeghX58jRXRFR1oGWKXexHp0zT8YBrmCq3hBxuQsO/4DAaeQtQP2
 7e6qJqFEKToDCfQ7FXHZbF7VtRZuAt9tNrbZWlEWo13PXXaBt/rJfwrMgfobmRyFd5HyABCNmEy
 Mp30oBtd5E2+b3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX3p5uBfpuIqmV
 ymTWmehmzKTCjawUKKKwcUt4Xb0/z8M3VGkbF/epXVhd6Rut/+15I+fvLvCxg3wpFmczibBkzUm
 HqktqF8VgANTGd3T3Yl7/qBF8WSY/7XNIX1ZRkJGdMHRmgpy3g0ZnZuqo19ft5TrSH8K9pzSR+N
 dPqe566fad+Asco39VXPbKQ9KURFKvKNxqctAKT5PSIFvkKWYvdCXksDkoXuPXZbA6roBqNj7NW
 REJ+U1uL3qy18LiXbiC+H5+vEx8y7dUmjHayv9QZDC6nzFuQH/jhEXFVJ95zppin3cOKUeGN2W5
 DxIRDqTF84N9eoiKUuFD7rXmTQOzK+3WKDKcJ/hA4O6i1gzbL6iEDXFAMVmzvKZD4eg599pnE8A
 nkx4WtI6Lwqmo0fYsC+Y8FD9/Wo6uYLYYhRMRhqgDO+maaxOVlcm1JrvZaWHXs81q1vDuu1toCB
 QAhso62Eh/hZ+l4FaPg==
X-Proofpoint-ORIG-GUID: 6WoPAbBnOKM1AdPthatWD2OeovpfaGrF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX/k7d3lz4C2v8
 PM5cM4lV/bnUge0LO1fYLypNXpfZMvGMXVfRO69PUFG9YxlkETT6ijXvrxrYw3OYrCR78KWyr0q
 PjW4hjBJ2CibZjtUgtUPCArn2M4HPu8=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa797bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=tjA5nVWDIhs3vSZUhDcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6WoPAbBnOKM1AdPthatWD2OeovpfaGrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_234416_681840_680734C3 
X-CRM114-Status: GOOD (  12.12  )
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

v3 was not picked, can this finally be applied?

Changes in v4:
- Add also Shikra since this was waiting so long that other drivers got
  merged in between!
- Split out defconfig update.
- Link to v3: https://patch.msgid.link/20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      interconnect: qcom: Make important drivers default
      interconnect: qcom: Add missing depends to Hawi, Maili, Nord and Shikra

 drivers/interconnect/qcom/Kconfig | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
---
base-commit: 15331b9ab4bdf066cda327e4f99ebee61915e68f
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


