Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA88EE87823
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=; b=OEm+0HVg8O0s15tk0Q/F4fQWng
	bB9vtEfzPIxW9KICHFzFACOMqqgHvTzhEJ5IdCizkhMgtLhmKMjSHcHdVzc8K8NFNp/cTRbeZv4oB
	MJxnuTHXVTjMen43WZBRXyb6ir8GeQF44f/x2QapH6IcHE7ycO14mqTTKLMCr7afEpF6nJ0I1j6bT
	9wLGt/O0QCdLNKrrvRwHzk/h6ds+JiGIk5h9Kcg14d1j6l1e2Fe3fvHEhfSsVjKCv6m7b404Jhq6H
	SRatCDnNBvjOVFQ64wn5AOgZ2jW6Ro7lFLr1b3yBVzcdWtWBgq60SZ3dHI5kHDrNue7emEvyJWzHD
	MohP2/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFyn-00000006cy1-2vMQ;
	Tue, 03 Feb 2026 12:58:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFyl-00000006cxg-0DaI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 12:58:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613BLveA2847379
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 12:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=; b=NDP5U6KU1pxo8VkU
	qfS/Zmd7R5f1KFqLk5ELIRifMxJ9JNYiBzbNAUOPg3MJYaH+qWcYvcyGk7uY+gnk
	yGuK1AscQwJPmTmOrlhBzW3JLTPf0bvuyyJ+MLBW1vFx3LF64hlufasS7IMhDatl
	kXr26pxBQuO2gyahXnB9z8f7RbsToGMQYzOn6GVkI2NfGZ3afBu8EipQU2eMQiCc
	PGFcewrzyQwNO1xwAaWNlsXXrcwL0SKcdv5Odl83tmvd0vAftIkltzNgV4HzUWqc
	hx9sPXxOs2HWv62X188q9jA+J+tYKmH9NXi3IgN1OU4wU+HnqYyBhQ81QDpkIkDy
	F7+CHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33g87s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 12:58:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so5151887a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770123480; x=1770728280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=;
        b=aPxLTdIdi4sDlvhMRJBqVyQLYWYTcpTKWAuXFsubk142LAgBAlXj3OXvZ6WGxPTi6T
         sTbLpR6YD+GfJ4CzEyuGB2cKHKme6/NcM8W6oFQsMT58L2fHY4tp90V8RZuf3Rocrox9
         Sb+hmemQw0baE1uUHKGTsCyJ/npNDy68siOQ355Ln6zeknvEcxYM+KwxhMTmsIzl+XIW
         d7YKUIzPqvUgOUdsFqPp7LFdHYOaM+fuTzmo2Fs+SZLERULf0ATe3bAjpp1bDdC51piD
         XJFn2BukWf+i43pEi+1y1LKJYpdqeGJEA0q5OvJelGsOZDIv4yIKlDRWNSm5HvKDn1lo
         QAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123480; x=1770728280;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=;
        b=gBho2+K5JfUaoUkFPJh0Mo3ryx7OL7lIiQ5S9V8d3iNoH6TZXZYnDCYA2q+ot2CHZ6
         QpB37TfMMFptN0etksTiF63ifjGHUlTb8ld0tgAOrlMflQ5O1vupuAel6+5B1eYu62UQ
         G+520POhIt3OE8JSDJl8YUkCnv8GZsLQd6Qj3dC+fQXSXbsmJORRRItXyzbm4kxC36AF
         dmwF0zJ8pKOgklnPr6ixFyj6kYwyJ7HGOVoNP4hh6H0yHbk/GJ4y+nVsBuJ3QzC/ymGx
         JkjrCSfx6FBxKRUMCwn2D2GmUlhhNdKp10bHSpFD8UmTdG6azrNdbGRUUgKbj/BK52e9
         L3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGj2r6LHFLh+CpphfK0sbOiQcMaKP0OG0rqJjCYtlI70lIpaKV7Ppi6XyaEb2bGZCi32SpGjeK7S4Piww0ia5Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+br5XnTQGYXb76aQMFqIZtfHD4PLPH6xiP5mdG+8XdYYVbB7L
	S6qMy/xPEJ3KcwrKbl7ZA5Pphm97ZrRdyjdYeOQ2+cznfi2VLg1tIl4pzyyuAAO71CmtUFN2q6/
	HyWkvQ9ovkHRxlSzEm0cAFLwQsAAW5fn9EOEAOcSASu+NmwOIdu5kFajLVNaIqKawy0lNGZDjM0
	9hWlk5bH64Mg==
X-Gm-Gg: AZuq6aLu/F8oFTcIaVpV19Y6COfovNLxMUtiNr37+u8Djw0IKCBeitCP7kccwjd+5mE
	ME34QKVoNrW7auCXVyqgdL6vGpqRj9Cl1aAi0OzZ42QwKNLBu+WwcTghKwgdmygUxkWEzePXZde
	xXnJzdmLphIHvdyU8MlNFK/esdq8SvzIewDKcc/ktiqan/4Y1Y1Hv3e7IaWnyp2yY8j5izen5Hc
	1qIyZlBFhiopYfV0zgWa1VDQArEGhPuKo+9qEBCv4ZXdaQGfqufZpO0AeiWy3VAivrGVt3YDnKt
	T6W2fh50l6vtwcS0RWHSSTpq+zrghR96MjOuSeZcEHObM1MqpYtk4iQY0zrtHiF+8RD10QRUZlp
	aJ0X/Rv6/
X-Received: by 2002:a17:90b:3fcc:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-3543b2f30d1mr12888756a91.2.1770123480146;
        Tue, 03 Feb 2026 04:58:00 -0800 (PST)
X-Received: by 2002:a17:90b:3fcc:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-3543b2f30d1mr12888727a91.2.1770123479509;
        Tue, 03 Feb 2026 04:57:59 -0800 (PST)
Received: from [192.168.1.102] ([120.60.74.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547778cb83sm2486926a91.13.2026.02.03.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:57:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>
In-Reply-To: <20260202151050.1446165-1-vincent.guittot@linaro.org>
References: <20260202151050.1446165-1-vincent.guittot@linaro.org>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
Message-Id: <177012347566.13350.2655028936116528318.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 18:27:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6981f0d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=A3/yxVAzUcVmDczBgoabkA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EvYTMdlcmL0OrTEahKgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: l5VGJzQ5ubcoYIRtc0P9D2d7MY0v5HKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMyBTYWx0ZWRfXx6oBa9UMWycu
 2C5OGuHJNsVJzW8OMo27CqCrISFHW6VffGb9cNge63rCxGVT33Tk4JXi/2b6YqN1xy2GFivdYql
 14GuFoodP4cynmKa3wp33VPghbA29yglw2Z446jAJjyfZetRsK71erhKM4mEuMcxvxaLntjWVSE
 hKz0sfdpJXTDunuze0ibHB5MU9C6jH1MFkO2CusZQUHLAghBAm9YuT5+AlIvDQkjliyFuvB9REZ
 wrOi0Yxog9Q+6EZF4Wqobw15PQqc1ia533q4gF5ZYSTk9j3mY0hbwa7Z90O8LlszdKr15EbvB+l
 tN6IO+2xDJrvg3T6OHvRfpoelHAtuIiGX7mYxv2oB3M2K/Im+VwYwlYFjB9fLllOLGBthxW+zPZ
 rtCp3ltgv6Yj3pXD4FaCwMcHS1IgDcda/wm9JwiNtBDHHgilbpKK3plrlU8CIuSLCpjPXk70FCH
 kDct+/m5P8+heFmRbwg==
X-Proofpoint-GUID: l5VGJzQ5ubcoYIRtc0P9D2d7MY0v5HKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_045803_239741_ADBC2F45 
X-CRM114-Status: GOOD (  10.35  )
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


On Mon, 02 Feb 2026 16:10:50 +0100, Vincent Guittot wrote:
> No error return is missing after the loop resulting in removing the
> ports from the list.
> 
> 

Applied, thanks!

[1/1] PCI: s32g: Fix ports parsing
      commit: b79e0875fe8144fcb09e4fc1cf386cb3b2262480

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


