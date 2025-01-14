Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82866C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx+xxhgfz6Qv2U93Mr0uyJHH3Uz3OWpv7e13MnI9pr4=; b=GXIN6fKPzx5lbPMiow5mj5KlCN
	72AhWSWF8bv+IHJlDNiyT1IxYSTt5PsIAxiDoUf/2UZ1/Zzi+a/hrzzeewhRd4RfRDp78aDfExH83
	RMhNbIfRnaJfjYkuYpmuRs2LjzxY94IJ4hpV76vU5o8ywrLrjsCJJt6neP9knfNkGpErrSnxmFmDg
	PVkMpsak0wIzQ6rYD9r3LoB/lMtGLk32lwWqNNqxt1kzxWv3dAIZZDKHUAyYcgmjjWPtkOkQgPOR+
	oLjIS48dJCXCB9vf38c+2kikdNBUeo21P/WPMeNAP8wL9lQwKyBzcyalC4fkhGTXghMbz3EYAEvPQ
	8+/gssMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlAX-00000009Hoy-3K4c;
	Tue, 14 Jan 2025 17:57:37 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl8f-00000009H8H-3R3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:55:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YXcH472G0z6CmQyd;
	Tue, 14 Jan 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1736877321; x=1739469322; bh=rx+xxhgfz6Qv2U93Mr0uyJHH
	3Uz3OWpv7e13MnI9pr4=; b=ro0Em/7mo2qYSG+4wF8NaY7HMuHC5oECKV3t+la6
	KyggnwIpZUwBvFMlG1aBzhAHriMjCEYTdU8Sq0c9Td6MXxFqvZFuuB1TjiFVibKF
	Fu1xR8VK3avTZwS4Gxjt8skCD4CXyIlP8N2VSke98A6EMwChSlg+drCp47iTXAC6
	eZvCXQm+3ArjlzGzyA7LN5R5rQNL48EjR2Bzlq4VRz16S3Ret+SS9sZA1bWJa/BZ
	AQUb0q6hzLUOZUQMcqeVLWthLQ6ejbEGmhGb5dnGGUPOJ/mU228+s0lik61FMSep
	pZCHy6AFKDR6VgD6wd5+Is0RP8nqs49Q+D8+U5Jm3NTiJw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id BUc2kVQEpj2k; Tue, 14 Jan 2025 17:55:21 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YXcGt0mRjz6CmQyb;
	Tue, 14 Jan 2025 17:55:17 +0000 (UTC)
Message-ID: <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
Date: Tue, 14 Jan 2025 09:55:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and remove
 paths
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095541_869793_B6C601F6 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
> +/**
> + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host and
> + *				   thereby the Host Bus Adapter (HBA)
> + * @host: pointer to SCSI host
> + */
> +static void ufshcd_scsi_host_put_callback(void *host)
> +{
> +	scsi_host_put(host);
> +}

Please rename ufshcd_scsi_host_put_callback() such that the function=20
name makes clear when this function is called instead of what the=20
function does.

Thanks,

Bart.

