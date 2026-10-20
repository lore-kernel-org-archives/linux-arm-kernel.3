Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B32A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGVgwl3f;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=bTf6u2bO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaRJoFp820wGDuLIad4CqTTahL72+upV0QSxufpoJyI=; b=DGVgwl3f13tGy/W9Sfme/wa42H
	MfFkHC06cBCQE+OR1REXS55Ct8wUEXVHB3tF1B/ddNKh8Fx6Tg1oxx3Fg4E0xMPd1p9ZKS6ZWYaHt
	xPNnkcqbBc0O3LOgMksOrMTQPTIsdZtYwv/kgJFuqe7QVmC7YK6UERtm0Xow18n/UMl999wO7CfJn
	VM15/VGFv6GxuLvHITwwrKJQUgXd85nEzMqkUp8GMHJGeWBQ8kM4ivk9R/rrkCy40G3Z0DDN8o6Yj
	ITx33R3d7rnCkP5tqyGRkuvvSRgmU4dTLxQ42R3iFA/dhhG43LI7cR/wnlv7ZPHrEtNn8mcBrW9eP
	OQ9jlkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Jc-00000009JFh-2dNH;
	Tue, 20 Oct 2026 09:39:28 +0000
Received: from npq-east2-cluster1-host3-snip4-3.eps.apple.com ([57.103.77.6] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6JW-00000009J5t-1Xlh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:39:23 +0000
Received: from outbound.st.icloud.com (unknown [10.168.160.109])
	by p00-icloudmta-junk-forwarder-us-central-1k-2 (Postfix) with ESMTPS id 3EB5718000B8;
	Tue, 20 Oct 2026 09:39:20 +0000 (UTC)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 5B00018006A6;
	Tue, 20 Oct 2026 09:39:15 +0000 (UTC)
X-ICL-RepId: 01a158ad-ea9e-77be-a574-0d91f7a53b9e
X-Suspected-Spam: true
X-ICL-Out-Info: HUtFB0MEWwJACUgHTUQeDxhcEV4JVgdeUEoRQ1APXxxCCkAdXwJFAUAZHVdQRARUBUpWUC1eCF4fTBwdDlgGEhZdRVoOWwRHFBcbXAAXGVFNCE4TBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQNAC0geDEEPHwYKVQZAD15RElgZAVwFXlZIeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489160; x=1824025160; bh=BaRJoFp820wGDuLIad4CqTTahL72+upV0QSxufpoJyI=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=bTf6u2bO/DseEvQFT6gPNsMQWPGW/ecZInU2RKc7O7SZ7gtEN+qU8e5llFeUgbRn1N9fCUxqyDHuN47rQMO7L5Ce5XH+dibZ3bPknNCvQh6HajhYiiHwBMWir7kKP5hX9fCC4EvDYbO53+tDbiTGhrGwofgfpbvFT7+LNQjTATAi1iVOuINiWs0La505JIgus2xuseplnISxLEncnCRKbbeoosQFIJI1udVLvhTAL+Ml/MFiYxbJ0DbOSqZxqOb3RUll9e9qSGmxzB548NsIMNm54SAMyyc/IWfLJjD0gtOlyoUIOE+BZLIesUFHZJeFsFsvhaOsvbcXy/osSgDldw==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 606B51800691;
	Tue, 20 Oct 2026 09:39:12 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:46 +0200
Subject: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: P1RivSia7mvEILQX6piLNZtW-SnVAnzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXz+qusdGMe59Q
 ozmhUAeZVGFtjJ7LZxj4dFtSo8qgNqmO0OL0baefzgRvjZTq/5cucMSoq/z/8J8lBtDkgrDX9j4
 1EsxoSXuLQzxiyMpbJ1j7wT/6IEchJ5iODWEOyljDRBuhFXH2//43XO5IKIU3vptv8FglOlc06j
 yZFlF2Xk96YShgrVG+owN1OprCKlwjagJQb7xbW8ayNwz3e2uogb6bJwpokYrGwYoTa5f1TxL+R
 c4gB/qJ55u8UVyLlYmq5vAvc8dkRNMCkkoLjH2W9L70cd+FqKqAbjlq7dRUIBk+ibqqQ0xqPLo3
 5LjXXb8b65ji6PclhZikg0MVgVDSAh8jJO+fQ6dd2MgcuRa+Vb7l2OMMv7Dskc=
X-Proofpoint-ORIG-GUID: P1RivSia7mvEILQX6piLNZtW-SnVAnzC
X-Authority-Info-Out: v=2.4 cv=UMfQ3Sfy c=1 sm=1 tr=0 ts=6ad736c5
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=AhhewsDm9b8M-hAPyywA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABtqijtwkJwGZwKjPwmzt2BpWebcDONZPRT27B7PKKItBFlOb8iyd7Ca2wsaquft/g8+HOoUpfV61jBB8Hvartcyp0aCJRNhsAd1fb754NpfnptkT0RXyXM56vxoDeUTnZlgcyWdoo7CuhRWd74RW3JTmyhHGPxZPV8h0QPaSYnMBVlDWPWIMXjCJ2p53ROJTInalQYSBk9AhmeTwTuYN/OmnpWax3a5pOwy2U+FF8gknU8ODLIg/zy9HdLI3VLtosTWFok49BnUHMzHXcE+uGvgIFKHGDYYLTxUCweRqbud//Fzq1CjLczHeWgNjWCIHekgP/lSEehG37rFQxRE4yNDzluQi+mh4oM0lLSg8M42O1dBB54flGlruOdi854DudcVWb4Br9VTv43Qf/muc9XXu7NepFSWkKGqBig83Cef2vXMbYM0TFcflr5JLQRyJ6fUhueDDBWqrYe5ynlkxiZj3xJM2ghiMOBiVIVbLoquYXXPeAknE9oAGjnUSRbJ6rekDRpCyzmHIGU9PEfiYG1CXfH/xZOtjFB99nNrIQqQBpOR2I/kyCL5RIo7IFhteE3T4bubTUNiS7nXeqAOtAcE0U4YEvxsisrjOztmdXWMNoqvoh79RWagBEFQE86RUTe+pCTdklsObNslx2tw5mxw6p65BIl6JggFDphSl8M6tKVpUJgUOU2OFl2sY8Xm4OsBg4kPwkLaP5nVFDNs0xKgtMovzPeNWVrS2aoH+soRkYdBHRo+26xLmN55bhtSc8hqi7VwRR+5HYiEkYsC8nyGMgzo+42RUSxBpLhbmWzRvdFGWsEzDxsTi0Fgk4vdOEW6kXOFbFMZsSSOdtHxk8HQpF3zvlSbZmjzv+bIfNh8sEuZ1dTEQHTZiWneJJ/tLGducKwYoY/eg2b4lgVOTZRaLKn4Um9Oa7A2f3qTkUkD8w8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023922_517393_738AEA11 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 922cf74c4eb8..384ff77771ea 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 	 * According to the spec, tile_cols_log2 shall be less than or equal
 	 * to 6.
 	 */
-	if (frame->tile_cols_log2 > 6)
+	if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
 		return -EINVAL;
 
 	if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

-- 
2.55.0


