Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D80C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDUeeBxD8CF2aks/Gxvhq5/zZiYV2qas2QSFlH/aLhQ=; b=UmqYUoixHopcUxwon3HcVrb7s5
	40w5asqZSqMJy0inLr+2ezt8IcmiHDPcg/TckRtFR7CV5Pp1LDoV1AFQPjTiv3HcV5YpTm/ycsewu
	UutEX99IhX4EluZLG9P50Wl1LsOjERqArzKOS4MB3MvoP40+8gevgulkPPWGmukoYc3bGAHwg4RMF
	QCzu6soOOtXZJV4rQx7Mgx2YHO5SKEQ5MjrIh8ryR8kNrsXcTXDLGge5YDQfFGAoqlWeLIIHklQ5K
	qmhobZo0bFrSdmpJB8y0ULZ4Bhz2pwYL25niro0mjEzfkOOw98uJxs/LKI02gQ+Tv6kgLFEygR2dv
	DGsk1n/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11LQ-00000009Jrq-3BvR;
	Mon, 31 Aug 2026 12:42:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11LM-00000009Jq9-48kC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:42:35 +0000
X-UUID: 69d7301ca53911f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c9ff823a-94c6-41c5-b850-44eeaaa89722,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:666a4fd82c97b30795e2ef1f5b60e771,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	,EDM:-3|-100,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 69d7301ca53911f19a56ed5b684f684d-20260831
X-User: lilinmao@kylinos.cn
Received: from [10.0.2.15] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 942591670; Mon, 31 Aug 2026 20:42:23 +0800
Message-ID: <6416cbee-35c7-4fc8-9a80-a25403eb1e6f@kylinos.cn>
Date: Mon, 31 Aug 2026 20:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: mxs-dcp: handle zero-length skcipher requests
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Leonard Crestez <cdleonard@gmail.com>,
 Radu Solea <radu.solea@nxp.com>, Franck LENORMAND
 <franck.lenormand@nxp.com>, linux-crypto@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260828093209.3179074-1-lilinmao@kylinos.cn>
 <apHgn8-IcTshYnfv@SMW015318>
From: Linmao Li <lilinmao@kylinos.cn>
In-Reply-To: <apHgn8-IcTshYnfv@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054233_358238_BDF61212 
X-CRM114-Status: GOOD (  15.35  )
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


在 2026/8/29 3:25, Frank Li 写道:
> On Fri, Aug 28, 2026 at 05:32:09PM +0800, Linmao Li wrote:
>> [You don't often get email from lilinmao@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Zero-length skcipher requests are valid no-ops, but MXS-DCP queues them.
> Any document show it? if return 0 when cryptelen, it is async, no
> call crypto_request_complete.
   Yes. CRYPTO_ALG_ASYNC means that the implementation may complete a
   request asynchronously, not that every request must do so.

   A return value of 0 indicates synchronous completion.  Only
   -EINPROGRESS and -EBUSY cause crypto_wait_req() to wait for the
   completion callback.  The existing fallback path relies on the same
   semantics.

   There is also a direct precedent in commit 8a4e047c6cc0
   ("crypto: marvell/cesa - Handle zero-length skcipher requests").
   Marvell CESA registers asynchronous skcipher algorithms but handles a
   zero-length request with:

           if (!req->cryptlen)
                   return 0;


Thanks,
Linmao

>
> Frank
>
>> When such a request reaches the worker, last_out_len remains zero. The
>> CBC completion path then subtracts AES_BLOCK_SIZE from this unsigned
>> value when updating the IV, causing the offset to underflow. On
>> decryption, the resulting source address precedes aes_in_buf.
>>
>> Return success before enqueueing zero-length requests. This avoids the
>> invalid source access and leaves the IV unchanged for a no-op.
>>
>> Fixes: fadd7a6e616b ("crypto: mxs-dcp - Fix AES issues")
>> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
>> ---
>>   drivers/crypto/mxs-dcp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
>> index 133ebc998236..60794b4d49fa 100644
>> --- a/drivers/crypto/mxs-dcp.c
>> +++ b/drivers/crypto/mxs-dcp.c
>> @@ -473,6 +473,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request *req, int enc, int ecb)
>>          struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
>>          int ret;
>>
>> +       if (!req->cryptlen)
>> +               return 0;
>> +
>>          if (unlikely(actx->key_len != AES_KEYSIZE_128 && !actx->key_referenced))
>>                  return mxs_dcp_block_fallback(req, enc);
>>
>>
>> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
>> --
>> 2.25.1
>>
>>

