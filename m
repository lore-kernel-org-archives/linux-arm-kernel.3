Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20EBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzBLylIyj8bVzNZ/mtrpV/DGOTTTimLWwe6O0B/wwds=; b=iF5CJwd/utJPB5oijILK6nm1CN
	PzYwjVOmTAvzYOK98C7mYUlqw/Kbw6bEPkPcAPqTnYvhUGu9AfyMbHwVkoXtgHsFsaihZ1jrD7VVo
	be52Gfz7YcB+moWD0QYe79H8yaU4szMZkam1I4VHwMD5Bfsul31uC+3hTnamRmxuXMLjIx/zCfUbk
	bHypgGuhj1n4kAi3LXnikmWr4vMmWjWpX3v5x2Fq8Gbr7JRbtuwi6GwAdDqMWqoGnpjrS9dB7Zc7C
	krf8L5rxY3pjtS2N08y4aGY8AgVrJnVP2J8b4OuKUwp1QCVOKts+Z8y9U2s0CMIGjusRA60Jp9AeO
	Mp5zLq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnok-00000009iqc-2GiD;
	Tue, 14 Jan 2025 20:47:18 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnjR-00000009hoW-24a7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:41:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YXgz06jcKzlgMVb;
	Tue, 14 Jan 2025 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1736887299; x=1739479300; bh=rzBLylIyj8bVzNZ/mtrpV/DG
	OTTTimLWwe6O0B/wwds=; b=mp/2kYD2KPxYJ5bSKS93GkD77RNSyy8HmPpnPSFd
	BS95wlSrOLR3cfu9bGk/Wh2uU7PsOw6u2musctDFAgnUN0cpfMXBv4+BTaqG54T8
	13SX3gwoV4npcdU+DsN1IeELPqTixLAq+nT0R9/STqWDeEBD5Ymt8GZ8Eqw8wMFc
	hJXsE44fDlHtRh3soEPpw6GJW4u4Ubae0fvHYTF1f7vcCWphiNDcvSKeUyqAXv5b
	m+S93mt/wX0EuUQDncHFi3+nOj092B2L3jRdyiv1/vKBLPVPAWiPKCBxTcCDW34+
	n8SMqjt3EVj0lXRCdr4tk21O+BZmj6lF479+2gYVfIiN6w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NCQDeftpnuhx; Tue, 14 Jan 2025 20:41:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YXgyl5sK3zlgTWK;
	Tue, 14 Jan 2025 20:41:35 +0000 (UTC)
Message-ID: <cec304ef-0a5d-4f80-aaa4-05432c7a0b88@acm.org>
Date: Tue, 14 Jan 2025 12:41:34 -0800
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
 <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
 <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_124149_594508_21121192 
X-CRM114-Status: GOOD (  17.53  )
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

On 1/14/25 11:56 AM, Andr=C3=A9 Draszik wrote:
> Hi Bart,
>=20
> On Tue, 2025-01-14 at 09:55 -0800, Bart Van Assche wrote:
>> On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
>>> +/**
>>> + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host a=
nd
>>> + *				=C2=A0=C2=A0 thereby the Host Bus Adapter (HBA)
>>> + * @host: pointer to SCSI host
>>> + */
>>> +static void ufshcd_scsi_host_put_callback(void *host)
>>> +{
>>> +	scsi_host_put(host);
>>> +}
>>
>> Please rename ufshcd_scsi_host_put_callback() such that the function
>> name makes clear when this function is called instead of what the
>> function does.
>=20
> Would you have a suggestion for such a name? Something like
> ufshcd_driver_release_action()?
>=20
> Unless I'm misunderstanding you, I believe most drivers use
> a function name that says what the function does, e.g.
> dell_wmi_ddv_debugfs_remove (just as a completely random
> example out of many).
>=20
> If going by when it is called and if applying this principle
> throughout ufshcd, then there can only ever be one such
> function in ufshcd, as all devm_add_action() callback actions
> happen at driver release, which surely isn't what you mean.
>=20
> You probably meant something different?

I meant what I wrote in my previous email: to chose another name
for ufshcd_scsi_host_put_callback() only. Having a function name that
duplicates the function body leaves readers of the code guessing
from where the function is called. BTW, naming callbacks after their
call site is a normal practice as far as I know. From ufs-qcom.c:

static const struct ufs_hba_variant_ops ufs_hba_qcom_vops =3D {
	.name                   =3D "qcom",
	.init                   =3D ufs_qcom_init,
	.exit                   =3D ufs_qcom_exit,
	.get_ufs_hci_version	=3D ufs_qcom_get_ufs_hci_version,
	.clk_scale_notify	=3D ufs_qcom_clk_scale_notify,
	.setup_clocks           =3D ufs_qcom_setup_clocks,
	.hce_enable_notify      =3D ufs_qcom_hce_enable_notify,
	.link_startup_notify    =3D ufs_qcom_link_startup_notify,
	.pwr_change_notify	=3D ufs_qcom_pwr_change_notify,
	.apply_dev_quirks	=3D ufs_qcom_apply_dev_quirks,
	.fixup_dev_quirks       =3D ufs_qcom_fixup_dev_quirks,
	.suspend		=3D ufs_qcom_suspend,
	.resume			=3D ufs_qcom_resume,
	.dbg_register_dump	=3D ufs_qcom_dump_dbg_regs,
	.device_reset		=3D ufs_qcom_device_reset,
	.config_scaling_param =3D ufs_qcom_config_scaling_param,
	.reinit_notify		=3D ufs_qcom_reinit_notify,
	.mcq_config_resource	=3D ufs_qcom_mcq_config_resource,
	.get_hba_mac		=3D ufs_qcom_get_hba_mac,
	.op_runtime_config	=3D ufs_qcom_op_runtime_config,
	.get_outstanding_cqs	=3D ufs_qcom_get_outstanding_cqs,
	.config_esi		=3D ufs_qcom_config_esi,
};

Bart.

