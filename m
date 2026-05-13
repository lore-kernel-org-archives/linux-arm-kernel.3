Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9E1CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=; b=dDPfqeRYSobbYeU/WhoGowUIVP
	VXr85Zsd8dMW/MfNccqoJwYv8hiMT/82U1S3kRcRP2/A4lUckt7yOJrRd9EvNCqxgPVfsMijoXLGk
	KGQeMzOmqVCKbaLCANKRy5VH2vRKoF1rvMgvokl/RR1/MkVRwmXZxPQGoVGXRm0hic5Uk2Hp/CznM
	sKUxv5ebChaQm04GnK2OEADNkc/0h6BF41myslLQI/qu1Sq4MG33lS410wlP+L+fd/Gpwv8iYYe84
	JeoJ/sHzUkIseeHW7I46UITXbV9maEOH2qZhTxNv2S5xGtVehDKFUhTHU/u9Hl7KQdfe8B6KRRPGX
	JV9OsQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN43Q-00000001ZXz-3v5p;
	Wed, 13 May 2026 07:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN43O-00000001ZXS-1pBA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:30:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D5Jc981393173
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=; b=XizRvr7rKeC51Bav
	NRHzaOrP4tUnNO071pVYcVxjacKC5uite+PkfZhEDiV5C845jGc4VHD59qEoW5ie
	Q0MM60jHTQdpCIWpVmyC8Z1+RE6PyXSbzEM7NIpsb4YNNViKGnAVWFlzEm+uB5iq
	GnB+dsyCWsT/ytAiKL5Vn7WEbHLcgYWcjOVVMv9sy5M2/0HpN/rFHE/nyu3Bq6wO
	/G9L0ptMs06m/ne2V667bA0eaZb1XpijwxQyYa1SDo9nP0LcAdW6d+xgf+ly13N+
	9J7ekWINfO+WockGYFA2IJfDFNeu+hzKV1DQGfHjwuZRkJ+HlifI1P5YcI9tU1nE
	8ysxTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k260g44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso49747601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657449; x=1779262249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=cQypS3YcWP1si9R8O+PmFvjrr02+8Ajf1TTHobcXeb8dKhWN9cILgcI/tU8CsvxmVg
         NHplFHMI+N5M5U80a2j/FfLAGKEDtzbfFWDrHZb842vUqR21QUU+8fq5XjW/AzwnsI6q
         7Hos4hoHFH/3IIe0GO8jxT7mAdKE2isXnGtTouMfyGixwPxBpcsdNUuD/URDMCUVgfII
         StRq9Wn90gm1UF3Xjlle91BwdF57xqjDy3GXo51oOhj3Dy9idWHWs6afkBhKVY4KW90w
         PZPHXdy/0YgcbYxy0isWToO7YGzNQ4bfrI42Ip4pMDT5s6SbCNu+JHRShPb8gyWWbowL
         KaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657449; x=1779262249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=qSnxRmiY3HposM7Q/ri47ZvLdurLF5NuYo0/AAB5hBsHAJ8hPMg8IjV9xpi86zmY60
         RfQQlN0bYzvlrzGTZslkg3PfDx0B1Xcx9np8LqS+ni8TBcIL+MDoUOkyUqb7NHBlyIcE
         QpYMq2pUWXGCapnS3/r1o43nyHChD8X/Mlhk0z0kAIlauXiwEZSnWQ7Y/WmBY8bRgvGp
         Sa5xuSvdTe/+l+yHHYZOJR+7q/hWXRGVN3sOtEH/Sk/6yQ2kD/q82xoIE+eyF1HTdK/z
         VAqq8GQ6s4sOv7cQMlCB3JYM6ThPHT2RVxY+uewlm1LMLtssiVQtl8ce/96iusRHDEVj
         CfjA==
X-Forwarded-Encrypted: i=1; AFNElJ+yCtyJQN/Ltp+GeleKvKiij43p5/0UGMY8HkzN+dxPc0So7UmUjOeM0X3epeQX2n6P3ARly4h3bfsoXIbLeGxD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ZVj3PaU31Ex6NlNxHnVwLmanI/hk4TYe3Bdt+tMrB6gIrICD
	zEqF+KYUCSQLaGKZGLlVeldYtYhENHDtulvNs6f2RmrO5el4CILAhDh7VkUDA1lyDcgTKUJyoHs
	TnkEYM9PMp7OiYOd1EMG3t7wAFR+ViupQtBmyEqEaERj9WBg0bY046DxpFhXw/ZVTwOKiKrNpZb
	P4ZA==
X-Gm-Gg: Acq92OFQPJ9B3gJ8MAwFJdbWJqClV1Xo0zb8UM8xcw/kTIQL+yyJgsjVvCv9r8iogCZ
	WfUsJKzu0QXahDkiTIdVFp3jQ/SOzhD8qScv35SmfaQ+C1vnCYB3RMbl8EMPq4QF4ZUuWqOVkBr
	ykqESzPvyYnrNVcX2N2avgYulLkObNXyoszs26hh5kaw4Uf2SSLrM12jkJGbf4x8uEPMjRqAIXE
	eWtbwYCn2QyJyi3b6sy6BLfYkNvBgJDx97ZUjBphJeoT07o7Ty+CaJcp4eYavA/NQGBDDoONJX9
	nSXWePX2SwJGbVGT/WgnM7ZrtZVQaOsp0l6N0H7BqLmsCCSg/Qjhc45mkt/Z9VOKQDD4bwj+tKi
	NuewAG+opcYWczQlhJnUxCGodxKR6P/+lJYHxbF8CgglPrajJ
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21300111cf.48.1778657448769;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21299651cf.48.1778657448240;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm47977105e9.5.2026.05.13.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:30:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, git@amd.com,
        shubhrajyoti.datta@gmail.com, Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] gpio: Add EIO GPIO support
Date: Wed, 13 May 2026 09:30:45 +0200
Message-ID: <177865742113.5804.18266308957127851579.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0428a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SWcx7dvh2R5ZX5NTVYcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NiBTYWx0ZWRfX/gm5yh7bIxZg
 Gbds+ALLuZ3THWaYTzlLf6OzumDqWs44lsaSA3eW7EA91dFtJj7pSqqoyUlXP7P6PbvyEk0hZdl
 K02eM0wK/FlCmEFm2YYQnhjQf4dFZ8KpzaTsou3LkezAtihqgCKHJW07QPSQykXRaw9xFlaOJ6A
 9hpIrXEMBPaGrlvL9ZJ6Z7rm2Yv5WTJM41goeQsKPKNg48oBBg4o3mqge1pxvbzr52d3uAduF4s
 VH7Y9J6rAIbu0Ea9INV1HkiCy/NsLsP/8BktUFqC1pZzUzMZI5IWcdQfhE3GQrCjxoqujWCz5jQ
 K4Dk40ogFkeL3xLa2bk+J38q2Q0xUMFkhX/uM+ypz0T+tkhntwFmZoIMVSwjK9MiKJQLKaIFWXy
 kuIf4e1D/zn9L/gREkvptVA5kWH/PelpxOxR3bOpLAgPjPPrq90YpBrk6sakzVfaMhlTaAnNa7N
 b10BTJyvDh2iUE9Fmfg==
X-Proofpoint-ORIG-GUID: YthkU2T78QbU8ethFSMebfPcSWFTj_FT
X-Proofpoint-GUID: YthkU2T78QbU8ethFSMebfPcSWFTj_FT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_003050_519053_4B6D1FD9 
X-CRM114-Status: GOOD (  13.75  )
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


On Tue, 12 May 2026 11:38:46 +0530, Shubhrajyoti Datta wrote:
> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.
> 
> Changes in v4:
> - Add Conor ack
> - Remove the min 52 for eio
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
      https://git.kernel.org/brgl/c/3eb639ef8da2d418ae69f3c8840c4e815036adc6
[2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
      https://git.kernel.org/brgl/c/18409d06b4a002cb8550ad7c20273bedc77851df
[3/3] gpio: zynq: Add eio gpio support
      https://git.kernel.org/brgl/c/eeb1d6dfd89344b17afe845d4839b79e37fdd547

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

