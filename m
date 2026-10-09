Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF6DCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=; b=tivdfHDd04fbCXhpMyudU3Y4Ig
	n7roAMOvu7wTr6ecGZz+0W3FzMTb1l7Tfa3AbXhr//sSp5uXPtnhuav0swf6hi0ZOxvFxBqRZvrZS
	3Rap23+daJpBKTTng0J490/yC+CqJ/mRvp9Nflu2eWKb1XcYtHDYS+rROe2ONrIjKElneKkp+Uh/b
	w1o53yu788VFfEo92PEkL2e5p6G8yaCO9ZEwgw6S1U6wl4nrpEM1mIrmaH2rGz2Eo5D2+T3FzM6Ci
	VfkkKoZ7NNxTiXjlhPROU7uTocYdiGxSzgT4CU1caIxmp9PzM3PS5Egtr0X0x594WBJz1vXOkQOD4
	ATUhsp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4nI-00000005hU5-0uzc;
	Fri, 09 Oct 2026 07:13:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4nG-00000005hTh-02ZC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:13:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b1762fb68aso662448a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530003; cv=none;
        d=google.com; s=arc-20260327;
        b=lH/KYInsuR+qxArty9yavFRADWmW9YHPjYPT1LDB47axbYNLsk+7/KKxr7DbMOpSZl
         BDcn0xfdw6bc7y2AM3JzBpItomS6Gjayi3cwwrFEmoo4lRS9Eo6GtzNu8Vc14TlCeSJi
         yLdxVPjxUi7JZn6YnlSzWebEdBtnpmisb2iLkNaejzinfFVm83bG4WtDUF9/x++sJNnn
         b56T9YSRl98RwEzXgsWTKiRfkRzuXdJx85IIImng366Q2J3RvNSWAZKj7IrvHko8XTR5
         6Yut9WsiXeQ3izMB8wWac7zlCqDS83ig2mzB/0bQ7YVQWAA7YI9by7+eDj0YjonWSJsG
         fZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        fh=JTniqbk4c+uxf2aFM8j+addnL0Ij07+QGHh/Na7PMUc=;
        b=Qmky52cewXzFeSmvOZ5NMyJj/DnoPTqFruY5I9C81m/Ww+JbfHGTnuiV/52ZFz97BN
         JY1gyAfGuJBvykYC9Gu3nR87zoUAkNYTABzsvNpwD9ptqXb3IZutLC42uOtCcZfTFrSI
         NqCwwCjpJPk8tCwnrSdKtWhnOx/IRwRr+d8DxHNWjhD3TkzkU2ljSstn40CalSa+Tzdh
         ykxB8NPWAc+hiDuPt73P3wt9z7YDhzGQEqdPWFBix8/4qjm3R+6QuWbE2Rxcs848x/mR
         gckEKPx2+ZKpZIeRX60FN/fNbXqlMgCkCXc4wisk6oRCqcIRo5DhAkXRSDcz8VbKgogy
         YLgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791530003; x=1792134803; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        b=aiaBwzYQZVoy5HGxzvhfpHhPuC7OyI/3CRV/ovvyhdriTDcBq6bsiB8+fFGw47pbJp
         2c3x/l4XJ7+Y+4SyKGq3Qqg8p9TPrVj0vszBDpf2NEDncAiFlJhxtcwTCnnwik0FGX6s
         J1NpnGeRGJOJqRGou++hQ1KaUkdbNkWTWl4kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530003; x=1792134803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFBRL4kBI14g6fXP2GAhg33nPv7jmDNqUCEmUpn6Yss=;
        b=X1atlBPCPDBRGl2qdoZqQ71UtRRxTyZOunIDBKSaSEfaHl173hAaSrTr1RBk8wk1hp
         0Fmyb4pSwNuMH6qNHR2vikicA61D9XKwCDSuhcuyXLJkWYRVsRA/nnWz2ww/b72MJWx5
         kgjx3Ap+JrsmpZoVjdhnuB4FBG9Q7/KgX9MX/WyJHqjm9mSQo+O4yPFOp7Uo6q1pekz3
         OTo7WC2W6I38bIw49Su0EUUqdxgOJ7y47mAAj5J4NvsYczlVwRMLXjPRQJE6yoD6+pEy
         BII0WrYOQpjlfkxiI2z9I5hJAuIiX3sL+vf2Gswa8PRf/ro0B9pq0CPsne5iDhMDJLMA
         iXTw==
X-Forwarded-Encrypted: i=1; AKwUvBzxvuGDcqHZV0uyXOpz5BZuGg0YuNVBvwOloP2Qnx3AyWJ+p99cAuxe7GWOOazWF0hGszEWggfMf0cnN6tS7DsL@lists.infradead.org
X-Gm-Message-State: AFq9FYJbJkXVjoBMGz6vf/GVCN4y9snjAk9fk8gdEHFu/k1qV1auUtBX
	aLGabB+RH63JbC2BxNt0vn18E8cbKeygPVuSmiEyHbt5DSRx0NOwq9+UhAu/tP9YlTYKrfDAVmB
	TOsw1io+NBpPQ98rxJO08rI2V5IImU4H8gkArC8m1
X-Gm-Gg: AYBFou0ZnmMXTQ73J4vTS0TkKYjyNHD69gvbsZKn7eHmy3BH2ctxU6Q1iL+pKPKgyeE
	OrSZd4MtKOjY6+fB8p+XWEOZ74wYd8z6CE8NRnOHyEQ845k375YXlq7w15RqxbwH8K5Dqbzqebm
	8JN3XIlAYFLRNuJSZAWvLnZ90Sj9YJvgpIm3in7kZVTwqiCtXiycTc1VbL71ZBVt73NvYFm7g7L
	phfX9Rwx5N/sY3Is99Xo8XT2iYGTP/YEXI2g5s7HUuZYip5yVRFTkDig6M3ZkAD76zFb1h/ogQe
	7pMgOUHT0WrsZ4MUE1Qp5tCD9qrxCoHbgpk1hYyBYHotmOhg+gTllYs=
X-Received: by 2002:a05:6402:46d9:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6b17c276146mr572039a12.31.1791530003510; Fri, 09 Oct 2026
 00:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
In-Reply-To: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 9 Oct 2026 08:13:11 +0100
X-Gm-Features: AclHuK97DD2slZ-807kznn7SMmv5V6q7RzL29UzjsjXS6Bj9SaUc0QJ5rsx_GSA
Message-ID: <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
To: Ting-Han Hou <ue081723@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001326_085115_26BAEC13 
X-CRM114-Status: GOOD (  21.40  )
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

On Tue, 6 Oct 2026 at 16:19, Ting-Han Hou <ue081723@gmail.com> wrote:
>
> With CHECK_DTBS enabled, Kbuild appends a schema validation command to
> the fdtoverlay command saved in a composite DTB's .cmd file. When DTB
> decomposition is requested, process_dtb() treats every word after -i as
> an input file, including the semicolon and the validator arguments.
> FIT generation then fails with FileNotFoundError while opening or
> checking the size of those words as files.
>
> Limit the input list to the fdtoverlay command before extracting its
> arguments. This preserves the base DTB and overlay order and ignores
> the subsequent schema validation command.
>
> Fixes: 17c31aded9a1 ("scripts/make_fit: Support decomposing DTBs")
> Assisted-by: LLM
> Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> ---
> Reproduced with DTBs and saved commands generated by the current Kbuild
> rules. Verified uncompressed and gzip FIT payloads, shared-base reuse,
> and the non-decomposed mode. The schema checker was a success-only
> stub; no hardware boot tests were run.
>
>  scripts/make_fit.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 15ba269..9bd35aa 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -292,7 +292,8 @@ def process_dtb(fname, args):
>
>          if 'scripts/dtc/fdtoverlay' in cmd:
>              # This depends on the structure of the composite DTB command
> -            files = cmd.split()
> +            # Ignore any subsequent commands, such as schema validation
> +            files = cmd.split(';', 1)[0].split()
>              files = files[files.index('-i') + 1:]
>          else:
>              files = [fname]
>
> base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
> --
> 2.52.0.windows.1

