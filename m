Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF9FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqOfoj2KSrjVqeuyp909FB717ygPmWnh3bKUWLSJo4w=; b=efAfLxew0BNT7+nryn5C63NJit
	VEyhRMjj9ZvMZ1G6TP/OvnTNvv4jr+PsUhCspmhOH5VOv3xs8EO7IHiXqf4EB2Q3/fQnbXZmDs9pB
	u8qi7ARZNswHG1Bd9SRF4PBLhKNuAnFmH0/MntFz5tFFXVUUOf0aiiyvzxAs2WnYLCTG5by2VJlZQ
	oIH9Xmea3E5bwGNMeNg9Qz409lSI04lesDTMf1mEf0u0QrXs+P8CWLklDWUzs6G8T7DuFDQ5qHXqD
	/VSZ8X3Vuw2Nbt+7IE5gJvMt0rDW+I1BggO+vLFYP/iLZo6MXvxgkf0QwOw0KqqRHEYCGoXv/bP5L
	GAxfNyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2CL-0000000G9aL-3pGH;
	Fri, 14 Feb 2025 20:22:05 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2Au-0000000G9S4-02Kl;
	Fri, 14 Feb 2025 20:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739564430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=goflvi9jAIVrizOs8HAMfz9P6xsSRiAVP1kJDCkvg6DSiv1QuOhaK5FLKqW53jZRtjIe9+UJrWDk5GeRX5l1QUQAm/WRUl4UOYK2qOtAOg1F5D/KpBvOGhHDdesaroDsKnqTeqRW34URJlQLQL/S/GeDFGNPDCoMb9woF1ynhhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739564430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SqOfoj2KSrjVqeuyp909FB717ygPmWnh3bKUWLSJo4w=; 
	b=Mu8xyI5z9zsc2sqR1sWZ+4zfneVTC+KVXQ28e/rYFLsqbTgXdjE+JJKhCpzyvV4dskZKybtQkP+Jjhil4Rh69yG7EoGCWZ9McLk7rfjf8toHEf1BtqJNIgZXOkXOPakvldAF+x3oowY7Lx34c9RKT8HJHnneynjl3vQCj87yMlE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739564430;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SqOfoj2KSrjVqeuyp909FB717ygPmWnh3bKUWLSJo4w=;
	b=WHV1mtgydivRLBm2fKfMEu/VYfQQmNABRuysJXeudaEXSJ/orR4qWCErPkFkvGNJ
	PNDIPSFaJChmW6N+8Rcz73L+whm9AtITOrgp0WZ46er8A8DrK6EN3gCylp4A6Tgzy32
	7YqlBJZk4j3IlnExKMSfbuFrb5H9r/YrNrCNQBU8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1739564427824276.79924110833304; Fri, 14 Feb 2025 12:20:27 -0800 (PST)
Date: Fri, 14 Feb 2025 21:20:27 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "Jiasheng Jiang" <jiashengjiangcool@gmail.com>
Cc: "tiffany.lin" <tiffany.lin@mediatek.com>,
	"andrew-ct.chen" <andrew-ct.chen@mediatek.com>,
	"yunfei.dong" <yunfei.dong@mediatek.com>,
	"mchehab" <mchehab@kernel.org>,
	"matthias.bgg" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>,
	"fullwaywang" <fullwaywang@outlook.com>,
	"linux-media" <linux-media@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>
Message-ID: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
In-Reply-To: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
References: <20250131012830.22394-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Add scp_put() to free the scp
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_122036_140348_D5628CDD 
X-CRM114-Status: GOOD (  21.03  )
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

Hey Jiasheng,

 ---- On Fri, 31 Jan 2025 02:28:30 +0100  Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote --- 
 > Add scp_put() to free the scp if devm_kzalloc() fails to avoid memory
 > leak.

Your commit message sounds a bit like you copy-pasted your code into the commit message.
What kind of memory is leaking here? Are we talking about SRAM memory?
I'd reword the commit message to something like this to give a bit more context:

On Mediatek devices with a system companion processor (SCP) the mtk_scp structure has to be removed explicitly to avoid a memory leak.
Free the structure in case the allocation of the firmware structure fails during the firmware initialization.

---

Additionally, the commit title says close to nothing to the reader as well.
How about: Fix memory leak in FW initialization

But as I stated above you should clarify what kind of memory we are talking about here.

Also just out of interest have you ever actually experienced issues with this?
It seems to me that the situation where you run out of Kernel memory should be quite rare.

Regards,
Sebastian

 > 
 > Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
 > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
 > ---
 >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)
 > 
 > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > index ff23b225db70..1b0bc47355c0 100644
 > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 > @@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 >      }
 >  
 >      fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 > -    if (!fw)
 > +    if (!fw) {
 > +        scp_put(scp);
 >          return ERR_PTR(-ENOMEM);
 > +    }
 > +
 >      fw->type = SCP;
 >      fw->ops = &mtk_vcodec_rproc_msg;
 >      fw->scp = scp;
 > -- 
 > 2.25.1
 > 
 > 
 > 


