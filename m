Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD8FEFB7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMd0qDawP3LtnNVvdXu0EXZ0bVclYbc/s4g1QlOu6ME=; b=Wt9HuXr1gSihsS/UOXEBFGbIc3
	ckJxa1I1Aw+onSOcYEefFk3H92b41Y5JKAiUm/lRz+ZmJkf5oCrGUhMgoM7vJImLS22a+NdZeD0K3
	9pUhxvi4oqQYsjfqUgW3HNpi8ZSZGMv4EeqJ1ncx5hdx684AVcU1K7W/IlzPBpa19orJTXvZZXLrm
	X+5p/8YB+lz5iVts8U20W4cAlLKbw1CT/gRKy4CG4UAELfN2CGbCrRUHHY0bvW3GrFDu0s/peAQ+M
	l+SOni3nOBOz2deEaORfvryntakc7/lnWMn3uq9o8+bvinhYZFFvaLV+Esa5sVzakSg1zaVm8Qo7m
	kuvq+cEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Yp-000000090xX-1AUi;
	Fri, 27 Feb 2026 19:31:40 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Yk-000000090pe-39WN;
	Fri, 27 Feb 2026 19:31:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fMz391N4VzlfgS0;
	Fri, 27 Feb 2026 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772220680; x=1774812681; bh=KMd0qDawP3LtnNVvdXu0EXZ0
	bVclYbc/s4g1QlOu6ME=; b=BId/d7GQJieiPJXeB15F3xR7jTlrDEn6whU05ToR
	lVQj5w9r6atacQ/ykKhH8hZNvihgIKl5O1jVgbWVBbNpWMWiCmqg4ufzhpGKNtET
	OlazOYWfWmhvjn/CYoIx37rTUIhKoCEFSMkxWTsrqAXMok9hNkwnWluCFCOecQEf
	NrcduviqoDilLdkeXcUWJMSl6oRgkYTxWfrje0243cgJjlT5r+GXPliCRXE3h7D4
	L+1XR9167R4wFe2XJ8jP1fzl1XyC4c4WmtjG+FEIdMyPK3SuQvRK/SR956bRoS4s
	ecSNPm+/sCSSxJvwJ3yrWoLLIDSDs+7KoxFhufzWgu/zqA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id F69mF0ONa_jO; Fri, 27 Feb 2026 19:31:20 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fMz2n0mQrzlfgRw;
	Fri, 27 Feb 2026 19:31:12 +0000 (UTC)
Message-ID: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Date: Fri, 27 Feb 2026 11:31:11 -0800
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_113134_870913_7F52FF46 
X-CRM114-Status: GOOD (  15.12  )
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

On 2/27/26 8:07 AM, Can Guo wrote:
> Before power mode change to a target power mode, TX Equalzation Training

"Equalzation" -> "Equalization"

> (EQTR) needs be done for that target power mode. In addition, before TX
> EQTR we need to change the power mode to HS-G1. These cannot happen
> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
> negotiated target power mode yet. It is neither approprite if all these
> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
> change the power mode to HS-G1 for TX EQTR.

approprite -> appropriate

Additionally, if "neither" occurs in a sentence, "nor" should occur in
the same sentence. I don't see "nor" in the above sentence?

> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
> done after vops negotiate_pwr_mode() and before vops pwr_change_notify().

This patch does much more than only introducing a new vendor operation.
Please make sure the patch description is complete.

> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;

Why has ENOTSUPP been changed into EOPNOTSUPP?

> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
> -			     struct ufs_pa_layer_attr *pwr_mode)
> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
> +				      struct ufs_pa_layer_attr *pwr_mode)
>   {
>   	int ret;

The double underscore prefix is typically used in the Linux kernel to
indicate that the caller holds a lock. That is not the case here. Please
choose another name for this function, e.g.
ufshcd_dme_change_power_mode().

Thanks,

Bart.

