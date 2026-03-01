Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC87FD0073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBxMJaUKa1C9JEFX2ZaVz3QyDUnGEtOPQuNCPOMH3xw=; b=eZMXmOkA6K1As6gqKu724MG4Al
	fqOGqr70JVcNFflIVGCFU3AWH7Oe2ReEbX7T2kAovhiwwn45eg67WUjTpIhZdYJVw5VAZd6Du+7Cd
	T09OmciIYYzgudANK9E0A+xBRB2Qj3g3f7ZBfiNHh2kkn0+OEOFmqjr6svRdCLi3DLRjOlJoWZayO
	xqPhUGrzP43VhDsUU1hHHRLA28nHENxe0Sv2MITnXFj17lEa6vM9wFXbfrSEeP6BKJyZjsSP0Ewbi
	vSpfhk04Gg4DrJWTNdix+kfBNmNgKAlhi4VUL5u/ggp2opMT4fpL1My1BOy+P3n6mzoL+gJ5ZO7QR
	R1Arm6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkxM-0000000BkHk-3TzN;
	Sun, 01 Mar 2026 17:51:52 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkxK-0000000BkDX-0k4a;
	Sun, 01 Mar 2026 17:51:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fP8l76g1fz1XM31H;
	Sun,  1 Mar 2026 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772387495; x=1774979496; bh=gBxMJaUKa1C9JEFX2ZaVz3Qy
	DUnGEtOPQuNCPOMH3xw=; b=BNwluevo8QwQgftfHB+DAqTk9ymT2rv4ZQaRtkv1
	fEE+STVCIEETCbEGDy6mPRz/sGX18yEGYpRhqFMzOGhGTN2IeFLZUb2xX5fByOva
	HSPj3fQYRzfbH8s99Gojromm8NSb7kZqaVqPqiRcwFpg0igO7/hef9tgIxeT1dUi
	6s/15zHh1tkYNv9+Ck+Jaa7msTHuvX1wexjljDqKd5CGnECL/W8Ueahcos4OV1rt
	k2Ub1EtAEcCNTTF6F6XWyjlYJmmStvxNYUokguq1Ocp3+fsvoTwY+RBUu7MIzxQS
	MB8AcL9iv6pLSpoLjF0H+Q4bgEu1UABPn13zEmAVM8AF1w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G5Djf-GxRJGn; Sun,  1 Mar 2026 17:51:35 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fP8kk4Xv4z1XM5jn;
	Sun,  1 Mar 2026 17:51:26 +0000 (UTC)
Message-ID: <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Date: Sun, 1 Mar 2026 09:51:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
 <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_095150_296914_59DEE547 
X-CRM114-Status: GOOD (  12.35  )
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

On 3/1/26 6:26 AM, Can Guo wrote:
> On 2/28/2026 3:31 AM, Bart Van Assche wrote:
>> On 2/27/26 8:07 AM, Can Guo wrote:
>>> -=C2=A0=C2=A0=C2=A0 return -ENOTSUPP;
>>> +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>>
>> Why has ENOTSUPP been changed into EOPNOTSUPP?
> I got a warning from checkpatch.pl when I add the new vops, so I change=
d=20
> the same for
> ufshcd_vops_pwr_change_notify() too.
>=20
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
Hi Can,

SUSv4 =3D Single UNIX Specification, Version 4. This is a standard that
defines how system calls should behave. Hence, ENOTSUPP must not be
returned as an error value by e.g. sysfs callbacks. As far as I know the
ufshcd_vops_pwr_change_notify() return value is never returned to user
space and hence returning ENOTSUPP from inside this function is fine.

If you want to keep this change in ufshcd_vops_pwr_change_notify()
please make it a separate patch.

Thanks,

Bart.

