Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFC8C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=; b=Es0zmk/PEm4KQ53Nsjma+Nh2v4
	ZRsuhkej1feZZkLPtnBoOLoGg5zyh0tDPdEPVjDqnpDbTn4Y3av4JYPcOFfIZMsn+5qtHM4RelyON
	VbR4LRQTdJMb8dHFBuWbq//8zkh2M6LY9FGEO11xL+QQ+MRVnMoGGRbCtrMQ2VKTj1G65kGrhO+uo
	rfZX7JOS4ADOjkMDcPQuB0/tv3m8sweFomASAp0eWayjkvAn3f6hgwhJ6jDt+X6BITXdfwsaxKU8z
	phX70k/VbSYtEJdYBT7Z5TpXYmHj9c3Jk+JymetNKu1Rr70eluAj0c7t5sK6Z9gl7hvNy3Et+Q3sn
	FPe2UE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdc-0000000C3KP-1rGV;
	Wed, 09 Sep 2026 14:51:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jdb-0000000C3JM-135U
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=; b=jn22LtLPvefhdzJSifkJFGuG/c
	1Lq4TtdYPzAdqC1TfeSyYvagpUn5kF82G21D88QFGi4MprlH1cRqHLw+RW9Ed7EtztZ0Ox4Gb1IpO
	yeSrwS1pkBdXO7CVoZ3kJ+AHJ4m8mIfRbUQBEAQcND86LHsAW4VpemKpMZ2vWHi3ocance13A7Beq
	Re/fUg1P2+zHCEhDwn3Vf7FsuG8IsNdLy21fBSVnv/TD2DMEJq+RPXg26RAQ7a0bvv0idPcN4SEgx
	Zg5ATq5trQ28B1upGIKr9dR/JbTJgkWj6GyxdmpqYaOGI0fVYmueSFsUJezGuug59Kuf9faUpTcPe
	4IpFu8Fg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4JdW-00000001K8g-2Xij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:50:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCjZ81400923
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=; b=iku3K+fV7u7wHY5q
	VA/Q9i/dsYog2LWsig7VmLJruKngKU+46GhI42u92lhNPiNq3mP9soLjzh75mlPA
	1TxEXKcBpa2B7NxmKqwXMyIWaespUQ4UZPLyjEhoHUCeySVdtxvVhZVpUUmwkNHK
	vbLbDy0lZYcGv4zLYfny4/ipdPUthYGefSMEAS54UWquyADN5etGBPEEis0U588r
	hgV35xALbJYDu2i4Ys7jAzijoNl44MYCd5goOq/8Srma4sw5fmbuk2RgyY5YQrIN
	rtISU6QZll1416dHhL56yo3Sx+Nm+spRXvlKg4app5dg4CXsn2dgvCqxpudmsuWS
	e0c/kw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0q3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:50:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-789eb1bdd79so176239137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965449; x=1789570249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=kuwtncdwEYWRCykllN/Sonv99/dBbDNFfQ/rOsKYwIEpFPGKKBWdALI4i2+8VLoeW2
         DUKD2jsxji8T4oL29y5WNDd3+fLJarg+McmkU2Avf7dJyzvq3Nt2XF1QYgjsPq8Ny2Qi
         Zq47eikHnS+K6jW2ZkHSIfJ2CL2MMNoRuO5bvYQA5hWBNC6PKu7JrqAIzjRPFkyrfYFU
         uf+5sDMwD31C8fsLcf7lf0UObwsMMVqXDlUon43Ezo0jFNoASSWetkIbPV6bgcbaP6Hp
         ML9dlZNIObTluMNhxGG5R8y/NoPUAx7obpW+KjEOhzXFrRKanambKpkpOGGZA+2vEp3c
         qZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965449; x=1789570249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=PGbfqezxsvEjMbOBeMkMlx8Y6dLF+95+TXZErDI9voFjPB0ikRkmju2x5I+kjw57r7
         f/vK3WphNkYhKv0EnlxGUVL52Du7/hB6rP8L6TIwbKy6mnzM3T6dfcWXZdCXZJAJHo2q
         eLZMOQw1x6XKekJs6PNB6vrLj36GqbVxkLP+JSevawrrgSPjXVGbyUgncUhSQ4VxTVdO
         JN0EkEBlm7h5dscC5PkbWfaGKX8phVLkN1d1P4zXfGmPekHP54mXZ5iQbKg+pcBRUrrp
         OMMm9msOYr2pqzzH/yFynIscoE64VRkbSt/0glVFbfTqdhy43oPUooN4eqs+RtCowQq3
         J9Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwljf3etr+8S+xVBrs6ShwFXnu+lrH6l9I0Sa1bhDSKI/mIg9L2NpkkCb288AWdxmLmmwppnjKURrYRXkI2tzRF@lists.infradead.org
X-Gm-Message-State: AFuF++lEM0AAfZpmiZlshKutwl0xufclJBjmxulSV9ifKEB/pLLLt8oB
	rVUb4F0FL+9D7RNdtnrRLnVDjttmtVJ9LPR/Wx0cjwpCBXe/9RYgk1pVxP/92mIMeg+r3OUJxX9
	PSx7oGQwZHoFr1e/feGqFdeAoFICT/N7H5nDNF1zSQd/UD+nv45pJRICvBAaBxhfRr4w2HbbpMk
	kWAA==
X-Gm-Gg: AYBFou3q0RgUIqPr6Ls0VoD5QkQ7wa/YaAvKTzqgY6v4wyv32xJPLXrZPrOnGGrH7Ue
	MEtCPdexnaD7oMBanY1507CgIjVHbvUpKi/KmEQKRtysHqaPeAOHFFEkZ2nhL/w7jw9cQOi0KX9
	dYtgQQxqZKedmZcgPpcY5m/pQbxhkEp15niKQOJo0ubTnNvinQO/eztMTop8SO30om+QKzFL/Bl
	toX+4PdpW7vQrWrSz1gnoaztVH7tXaU/CRzdgLTOcX6m1waVqCBSFZ2CVzyaY02zAwpKNGn6S+S
	l4XfEy7IMYb6z+OVbof4mJIf+RYSxGEUj5kH+BugmfaSmLGSwu3wpMG2vDNT0B/yxC7aLjUz9im
	5BSlSy4g57eyneavrtSPxQQ==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883130137.1.1788965448892;
        Wed, 09 Sep 2026 07:50:48 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883021137.1.1788965443567;
        Wed, 09 Sep 2026 07:50:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d57fd88sm767240366b.44.2026.09.09.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:50:42 -0700 (PDT)
Message-ID: <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QqMZCxT9u8UJQ-R-oUIx3Yvj5MbOTfS0
X-Proofpoint-GUID: QqMZCxT9u8UJQ-R-oUIx3Yvj5MbOTfS0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXxStQYwctvqa1
 f8lk08+QPaR6Eb/bFXvKi5/nC8kr9QM5HjHjygXeDPZHUoMH4QWkJEU57/UZkfFR7jkNqYiel3P
 7zEBN/vt8mAwuYsMSsprIibkZbewsE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXxn2Jg1sEWql8
 eMfUVbJAuV0IHiYFXfZGH3fCtgJQZk0tHdeDpd+SscDpl05xLLZXCqrPQok5qWq8ocyOHu8Safa
 Kbk3duwq8qYS1vFPQQiZEIPPkotW+L21yuWfXETL7RTSM4qSNwn72IfuntgU9H+ud8ZEoYwqQBn
 XguRzbRD5vH2/PouaWMKg1W1zwlvXdakgvcbYAgUfrjm4jGtNrdeGEE7xAAqV787sOIpK5Fpx3r
 YgnTp1h6L/OYuLmTCT6HEPJV7OhOK9glk2HElasfeSooKt5OtJOMHBRKgYomQ6Tgqho6Qe6SxnM
 kdPUWv8SD6PhFbGThKWIVCxmA+FvvI4PVnvSm4NIYjqFGRz0v7SfFSDie6fdvRGDK68K4VXztDz
 8XQ+Mk43n1nsi/rnKOkfZG/vLINtAi38xhwaYSRzeE7RyKygax9XssbN5H18wffiypOOf0FMsfO
 0WGsUKP4pBgbQUtezKA==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa1724a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_155055_128532_84154527 
X-CRM114-Status: GOOD (  11.74  )
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

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +&i2c8 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;

This property is undocumented and unconsumed

Konrad

