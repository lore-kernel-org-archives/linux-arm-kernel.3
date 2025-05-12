Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03D8C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=; b=MJt/B7W39uHDpcGww7TuoamQbM
	BPdVXpNDtc3/PZSWbIgaDaAf6dFIdu81UnXtySHMphRFUdtzvdlWvmvXBXmY2n0iS2IryKi7VwwCM
	BBengPq0y105wS0y2XDKhfrowP/kG/sCGbRJX73e5/k7QazYTvEfe8APV9wuL+U0yrLSSUkD7S9z1
	E6HZ5XnJY+9KUbmbYQz250hM3IeoKtW9LXv+vudkoMjAGmCXaCCU5StjypT9vErQPbmWrIxWvCEHO
	dlXHhVqvYg0PSKjVgMYAscjHYbbfL8eALnaULyRdgbB+oG6+CUR8JixKrLL/6PiDQemrPgc3QZ08E
	Gjoq7umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZmm-0000000AdJS-26IY;
	Mon, 12 May 2025 20:30:04 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZkI-0000000Ad7e-1Y08
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747081629; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tARlmZoyuwgXiJ2bKrmPM5iavTSVlKTpXww+TMyIb5QQig9upe76/vGR/8LfWtYQ1K
    vZJuhZjelIKE+WYzl8GO+6XRrzE0kPtZvjAkKDEoBGzdMFVUupusizSN0ea6YrbkXK0d
    Q++piAtFMaaf/x7xOElkrjcXJIFJBp9CZdlV5zSfGE4XbVlMunBrCezJpgObUKc5DbIO
    bPkncbSSEs6JsvJj8CQoUzsGpgipwfqUga9pAIF5gVoTPZzqhbMV/oQCE+0TPZRCYLov
    EPayvF41G8/e45KuUnZAhUrsYoqovT69u+BW8e6HcZ4OWmbt1aCv8Cd4PvssQd0/zSvR
    4hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=lcBpbyfI2r5+LH/yMihvuOpaXWp/smIR1tKvuYwhFZSq/64g6a61ikbKF5nvyl8Dxz
    AeyABbjJWorgMWlNP0tU1mfBaIGKzFrwNyhQ+SErpsSGNPUlfzsokPC8sp9IZQgBYY/F
    zgEhGG+aCQj/kHfc7Kr96GmRSAqWPPUhj4WMN22juGqpbP45la5de/Ht04J+eYEJNTnr
    Mm4hlx3d7FFCvv3xQBir9264zMcV1Lg9EfFU4a8SRYeucJ78nPKtZoANi2m6vML/4yLx
    MM/WpfiQZ/GV4g5gsHEmOVSbZu6hOVWMnfoMeGdUqCIvc+pLM7UqkoLm0zkT5Qh+eGXH
    vFPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=i869kQLFtIoAtFkdzXT9SNX/PAK8AlAvg6UMDIYSS+ijuPO25FAnDaT7OflcuovSs4
    8gNlxgqDy4ov4FTRd8zYynB1erwa/dArl6/Q17LxuucMgwSrg33HYm/D/OmmUMlW5uuX
    R+CGN3pXVNAjzkHLYt2GT3/GtM0gkGc9/MZO4yrDnqYK8mhle7RrzHLTIGs/6GVvKA6J
    ruO6tCr/qlQUBpWtXfgdoyFSQPTROFXqSmI1+GLd9wE5ueHqBvK6X5OtRWd9G9oKQnHG
    MPeeTdL3FZ2JaMA84g6NTdqmsT57IlF044rN62KnWvyImq9sgGycgOfRCap2KZL6rfRV
    HZtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1747081629;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-ID:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=E2vS+B7LB+AFC3F4dP3OSB23QlahSAk3A/y+OJVKLCw=;
    b=VlXzukrpPaXIfwjqkZgo4O5jRiTbh8HkYhEGnXP40OHvbcrZfBX34LFFpzl/QzHvFd
    IPNgRnwgy7twlaqBI3DQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b3514CKR8d9R
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 12 May 2025 22:27:08 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <michael@fossekall.de>)
	id 1uEZjv-0005UG-34;
	Mon, 12 May 2025 22:27:07 +0200
Date: Mon, 12 May 2025 22:27:06 +0200
From: Michael <michael@fossekall.de>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <aCJZmm8rC0RwbcBX@a98shuttle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_132730_681444_847F59F2 
X-CRM114-Status: UNSURE (   7.93  )
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

Hi,

with v6.9 and later there is no output on the BananaPI HDMI connector.

I have bisected the issue to the following commit:

   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")

With this patch, sun4i_hdmi_connector_clock_valid() is occasionally 
called with clock=0, causing the function to return MODE_NOCLOCK.
In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is 
always!=0, maybe that gives someone a hint.

-- 
Michael

