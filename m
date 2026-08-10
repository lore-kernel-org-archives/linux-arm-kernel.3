Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B9C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=; b=kKaR+vR6wl1XpCK1m0S7VSruS6
	wlsslHcM4FcqNpGSluCITm7gtzQgDkrukIhi84kZ2Bey7MmR0XzLRaD3qdqmZK9ihtm2uAUI64T5o
	uSgYdoskFVHkFmit0BdC9e2HlewAVFHWafzGjYHArYGmnebP6E27lDh14yDXjw1fbFYRqXsjzMyVh
	7IUM6lhJsQQjon2/Lw6TvE39bG42kkWCafNdCfHL+yc73K7KU3GU8Zon3cysaPqkxp805DMzkD+X/
	BzIGdX+zJQ5sBow2w3rgpq9d2sEPuufcFoljAYMe+1y+UwVaYwH47/TUGnxs44W6lTRi5evzqRhKP
	OVYH+XRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOKc-0000000Bdv9-1lbL;
	Mon, 10 Aug 2026 11:38:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOKZ-0000000BduP-0uw4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:38:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S2wo890229
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=; b=mbg3AcPAiU5wmwtz
	hpVcMcuEpoUK6DDQftsWwzPCSfhxLYIGNyJnIl9PZHKBuRf0NR/nI4T7khqn9P45
	Uj4jhIOQuN8NkKAUOwk6e1fk3aUWJsLKGcuNRaA3dHFV3QTHBLEAOJD/Vkh6KJXG
	PB9ZPaanYvvEB6xenjN3f0dEC0EKgH45XQgE5wvBPFGpMpQW3vttFr7okaQ8lnr0
	fYIQRN4e/0WjKMkREPUWncca/wyJ6tZf0tJudcEl1uo1Z9vvzGTe43B7Wa/kROJK
	X5bA5/dUtKpTo93iZN1urCy/g+2P2esN3K1wjIoOjv8MPhEvgoyLr05NDCWtJCYZ
	OhLZvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v49914-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:38:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so19235351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786361889; x=1786966689; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=NrmyK9hmvnYXkpDA/8pQBY0VGP21ijIYBuqGKhG5Mb4eLiCsR1jjdurGkNxsB7eIJ9
         EjgFwQrXC9/rTH7/xCNSWbd/PRlzq/gBMBNc+rEH0aOyX1uuE5WAFc5LdeoyIwLVPOBy
         lm2t70wiBReQNTWhKlKS+OqtO1REP2+WjsjfuYxsXjyzmYniHNDEjcX6ncJG1QFV0jab
         wr3F83KJNHkUhP3BAoF9AZ4F3rlFNGIMI1Kv+GoZN/5SqRUBwH6tn2ylQsXVUuFuZXcr
         Y89DTH0/AsyprMierfPVM1gSD7giwjq64QQG9c8OeEZvdlAircmTQdzyOb/LqRxDjJDY
         xEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361889; x=1786966689;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=BnO2TcAdd+01G6vpA2ALzZPbY+j1QvZEn91cypfE4YYXCNDVnaayML6njtoEgANCq1
         vAQBH9KapI8dqWUcQ5RLoTwjYvLP3UgPKro8SSLSCQ8hBY4wSkKEoOyr4YhkDDPzsd9u
         xtKKMLPCMXQMVsXpzpIYkLtNZICgEnWIhBo5+eub/fPXgAmLY+gcGmZxSX4QnzfLlaFf
         aFW1SktPp9WiMa4X91gQYokpcEikt4YXpzvw59ADY7SYKwPENj+eIT3TJGGsjJNkOIIW
         aqGRv0+QFhaKOLSoCuf/UiA1LrRdRMMqFW8TfyKvihmyAjJn21Seoxluju8vFFgEs/jY
         a8Aw==
X-Forwarded-Encrypted: i=1; AHgh+RrWC5IjY4uC/7yi3FEs2JRO89GWWhN8Wwg5nOHdO2TnRw+7c8NySE2yeVQ57AFiLvVNXbxOmjfXszc8XYuFTv8+@lists.infradead.org
X-Gm-Message-State: AOJu0YxEX9rtdHQsQLiYKtpNlPMwbQBA0Ds/zT5LlVSYXuoGbK2nGFDK
	+xSB1wezbt6dkMvwbPRkbunIR33PMl7UKabdXBQ0B04+bM9UcFt2VIhZBSG6vvcA6XJTvycG83e
	Kr8Ybr3GSwmrKJgIhuRsYDMGpIL3y+rKy76ncNdoaeTBMqSfsWAOeBFq3lXtc7OWQUlmXoSkqNZ
	LUHQ==
X-Gm-Gg: AR+sD13wwvlMDPy66SBAq6lKDOJhcXYnpmnVGwgKI4gab54E3Tudes2wDcQi/A8u5vI
	DVYi5cksaUgOjEGHcPRpSlqG8qwFXM59SVrLgaT/PgasTYUMOFB5rI+b40ggfTgh0tt+P+y4dY+
	hpD7merrNf/Q3MbO4T2Qq3WkNrdjhTHbdx2lqFinfUJWQQGLsECj8veOVmmo2HjI+KkCvEyuVLp
	laXe5+1FQQ/hEdI/2ye1KEfsGHq29WPjaJHO7IGu4TVHVNhWvt5Y53hvY50D9h1PcW3+ohY4eA7
	pOs2iujosMrezskGBXhr6zgvezFp5T+iOK+PFKMZIdk1Yyj+VcY5Oa99D1wlzpUcvEzjFO4Qxrd
	IxSd6q7EgsXiN4Ehgi09QYCm+POtg
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11211071cf.14.1786361889593;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11210361cf.14.1786361889104;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145589sm36117311f8f.1.2026.08.10.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] pinctrl: Add support for the Rockchip RV1106
Date: Mon, 10 Aug 2026 13:38:05 +0200
Message-ID: <178636188265.27644.8818691655755329598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hImsXLak86D6gkWZ-cWXW_QySeDBKuPS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX7PH+e2vHrkU/
 KK5L3eWfEDV2Jv423r5qM9DuRUv8DvObESymqLThipUzS87qm63YYg2zWAPVwLZwOxBEsWrvttY
 7z6nkMAlNIFj/aVVamYeXs+6puvTL68=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79b822 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6BMtE0E8ImWS15-xy3gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXxG+GMWyfKHcQ
 gym0TfiTl5Xq/Z6UTcCfkYODbjxPGCC5BHuNvW817/pysF9AOKj6X33yXhCgXeO6SJA3QQBPIZy
 inWTGy0LO7JcmXYD4vzUVCegAvitfjb763kkCohcHoNGil5DtKehFIzEk/zWJNhyjbOCNtFB0s3
 Vs31Ms6RXjhvtLVta9GUrb5mGtXtExD8QoDA4kiVGg8JFWtAyUzFS8B+XINYS89cwl7SGXgLfvf
 noU91RArk80hZAmlilrJEWDE2zUzRuoOStHCoc+NwzGg3bV+RSdh+PqHEKqBZGzupTCQASHlh+J
 XQ2Btfz2ZWXAx5SJOv5pz4+EEWH0N4MutLF5e4oR5kVBDA0WzvijzFOeuJiMjpIJTdgOmvh0slY
 slkusR+bupL8QJF6FAuer20ScfG/ZlLJYfHNIyTyXk+31qoVRWXIQFRMVR1jwyDsDa1vRyZyMul
 4+i+VNIn9ZnWvaL0hcQ==
X-Proofpoint-GUID: hImsXLak86D6gkWZ-cWXW_QySeDBKuPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_043811_370004_60EFABB5 
X-CRM114-Status: GOOD (  13.81  )
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


On Wed, 29 Jul 2026 07:27:24 -0600, Simon Glass wrote:
> This series adds pinctrl support for the Rockchip RV1106 and its
> RV1103 package variant, split out from the initial RV1106 enablement
> series [1] following feedback to submit per subsystem.
> 
> On this SoC each GPIO bank has a dedicated IO control (IOC) register
> block, unlike earlier Rockchip designs where the registers of all
> banks share a GRF region. Following Jonas's review of v1, each bank
> node now references the syscon for its own IOC block through a
> rockchip,grf phandle and the driver uses a separate regmap per bank,
> so no regmap crosses a block boundary.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
      https://git.kernel.org/brgl/c/2f2b1a84fc141575eeabfacbd7c35af0b5dbb0b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

