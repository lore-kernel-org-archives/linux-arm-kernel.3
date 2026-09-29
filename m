Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6915CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 01:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=; b=dejsH0a23jUeAb73vNawVrhRpO
	v8ieYzmTkhsSCs4wwHzE9Tx/yBlxxnLdqjVngRS1wACr154diLpKv9tHsZuJGqACJtO8RRgNclpzw
	59gBtafWK4JEIA4wQbsIn52/7/kU3V2XgLMOavZvaXwsfRltFkFt6ns82tdaYWs5E5cSlb261N6Pj
	accFZckNhJa0jBv/L2pmmHsOXiiHjZEeA/zwagcf4isD3uv70e8mA9HX4D3MD0xy5eMlBWzEM6CQx
	9RTU1vcfnGK+HBV/3MEWKQmnKkpwTBfUreAEUnCqntvW+jwc8fRhXE2gM9VdDtLjlL+kJgc+rBHBt
	eGYg+JCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMmZ-000000023kL-12lb;
	Tue, 29 Sep 2026 01:37:23 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMmW-000000023jk-37n0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 01:37:21 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2db1ca069c8so16121835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 18:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645839; cv=none;
        d=google.com; s=arc-20260327;
        b=KDopPjJdWD2xOweq6ytQCZlqE9YTpalpk11SfiThhqEp4qt2zosllJiMgvmj1Gg/Xw
         s5fFQw2ikgvpt41/rez8RKwvhgho4U8RnY+3vUB8dOrzuUdCp3+wIUHjDidL+H+wAZo7
         4rZXAcm9Di1SYaalyE5TwbGMUbjdZMkZ/ksJydvog3kuTXb9NSpVYU9MYnK2S4vTsBsO
         zqHl810OIlc2x91zg84plAk/filedYza8yY9lph7Gu60JsBPulJpKeeCTjIjrMK1Gy9L
         tHhkrZ2n3IH7BzRRoC698SgXHYnz6n+Yb3+5Cz4F4ByrZeTF7EahhKLdGJVHm2W0P/oE
         GVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        fh=fRhEKzrXjG2vpQUfbzYRM93aFufzOmy/9xyJfgSmaRc=;
        b=jDHZ4veDXgQIoIvnZfKcbkD5eLhchzGLialM/aaavEVhnc7kF8vQjs/aJF1pkGH297
         q2EHpQbuu524PMew5wRxvhqJrCW6R/HGGAW16cW+hH8oo4rCZZy+zRschs+k6ACb8YQJ
         eEtCz1pWvh0EV7xx3WWk9xcxsSVUs60XytixlRzP7ljwgK8P+LklGOGRfqVBWBfTrvd7
         HJ7mgpjj/lOe8W4X7scV0+8rgj2Shdx2fFCOnA0BPeE62pJGTHKGWk6SSGQG435oYp/F
         0agBGzmt8sxBPruON0hYrnWsnq5O3ZervJ4TDBeJvo/NS9WolGW6r2MQyrBCe7yWyrbF
         cxMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645839; x=1791250639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=AtQgKhgTw9ZP8lzZ5Viq24G8ijgtFZujBY9ZmzZ3W18s3/iSKpfgq68U4KIaC59//1
         MOL4MOXiA4xRnECY7dlwWFfLcR4IPrRZ+ru+PBjAtepSbMyyH/7VVmLDCMX+aveaX7jr
         St1IJZ09WvdYvaiU0wRf5WiHS7POu3EknFYIrbwo0N+s2CeGK10Fzd4hZ0L3N8z2iyT+
         maQIucQ7l5IIuW2ww70q8s22NbtM8liHJjiwrbezv1QpgjJknrjLQhBPXmQxRYZJKxFb
         wY01AK35XDaTnFILCAMFXKHavO+Ae7csWkPoeHXLgPxWw3hoov77BJHo+RQRTJzWAfa/
         31/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645839; x=1791250639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=tYtYN3MVO8r5BIcwqwcHTZoPR6lcAg2xZvAhjg76AHZ6etSSlOhzv3EflHnV/1OD2s
         30k0bC7I+6uDMK5JXaeYrOGOuc+snHILJnqrjs8OpJzouDb5H7ALAYhIGtcSZfIIzGC5
         36kIuK3FOsO7rbuca7j++ykAvDzx+aG84i6rrOB0fKMv/P0DFFyzu0FNfxZIqAUAndqV
         SwVK4jHbPtROzzs7ulZRVT0ufoq615HDg69a0PmlNWnIma4lfxzL9EUytuBPQySO8BtA
         EUZ1rN+WUHGomFLSC07fyhq35vWPYdzuj8MSFoi9q4rit0lC3ANPkHWq1q827vCHGOPv
         b5iA==
X-Forwarded-Encrypted: i=1; AKwUvByvfU7rGXPK9frrnk1xja2o/Smp3QBm96hzSs2ujbZ2PgzjMFEcy7cn9mxMJkgkynnPg/4AhpqkSA08s7sv+JAB@lists.infradead.org
X-Gm-Message-State: AFq9FYLyuvOEibeJPJ+sJ88GACCUzNgj/MRLaMwPzoQaoHYMWSkrPgpc
	Px7pSu2Sfk86CYnLbbWgv98+LwoSx04SdCuXJsz2tHg6v8GEPCldvQLAf7HgN9ifzFapHDuobtr
	BHLBr6mme4/E7I7WbJV/oatEmZure+QE=
X-Gm-Gg: AYBFou3rsn+Mm0B4Dg34XeMTj67tKvbCxqK04waKFyiRsyYasUEAVH2+1YPeV/v1o5Y
	yhli9Xaew1GRQn7uU/3V6qhB6vCbmTALJbwMd6UblQUldfX+Dfc09HH3SUISC5tCBSrzebJAX4B
	f91vYX4X9UWmLQARaq2se8+ymlST+4cgrr15Dyl0jxStBS2xZFLiLqfDOpGeGVgR1VO7WK90PXC
	C2i8TM7gG8zatrgWgjUJkvAcJejBkTw3O3BGd/MPgpjnpX7wNSUloosfcQ9Yar542+gxpJrdULg
	9P1gzqrvn+sj7lPILgDKQ1cNIpR78kcOyD6XBJm8d4qghRQCWrADkU0=
X-Received: by 2002:a17:903:3c4d:b0:2dd:c100:b2c6 with SMTP id
 d9443c01a7336-2df7dc506e7mr124008955ad.49.1790645839130; Mon, 28 Sep 2026
 18:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com> <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
In-Reply-To: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Sep 2026 09:37:05 +0800
X-Gm-Features: AclHuK-gi7etBZa6zDkid3kRxBB448XKArKELjgsns_Uu77zQnT7DY8d5A5ELVQ
Message-ID: <CAA+D8APNVx1P0G2pPJ3W9u0eY2pqsKeV0Ar0Aau9AeR5mYgpgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_183720_786231_27F96422 
X-CRM114-Status: GOOD (  12.80  )
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

On Mon, Sep 28, 2026 at 7:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports three independent conversion pairs
> > (A, B, C). The driver previously registered a single DAI with generic
> > stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> > multiple independent conversion paths from being used simultaneously.
>
> This and patch 5 are not threaded with the rest of the series which
> really upsets b4 :( .  I'll fix it up but please look into your tooling
> here.

Thanks.  There was an error in the thread, the patch 4 and 5 was blocked.
Then I resend patch 4 and 5.

Best regards
Shengjiu Wang

