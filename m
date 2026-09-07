Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuVXo6f9Z1spKRdlImVETM3b3qRtGRWXee9cH9hEi4U=; b=Jpt9HXiDt21i6x8huMmOFDQQhV
	H3CD32Nyw5Ni+5iNzdht3+1KkVPr9lfDpBps8mZwouP698wm/ippV3RvrGqYkqJKI6WfJTsqqgw1r
	BHTdcWZVd+DIIz65dpexy4W53ukUiXdmzgtJX0rNMqPyGSEavinp4fcCNOrqLZyI9uxe3bEsuZopc
	UbLtJXieDcE9T/zRcfDptXkfvpJtvMt2Ecw6gUMOt2ycEIT2pd/57sS2U61YLErjNRuUIkONILkXm
	Qo5V/ochM5+BtG+laBSYfTQWcAC9aFs0/URjhq97F7O3CV8zj5eFklSfDUXQAjGeg0tLV2wACzU1W
	5xulLiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gbO-00000007kLF-31pM;
	Mon, 07 Sep 2026 21:10:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3gbH-00000007kKB-3T7p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 21:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788815398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuVXo6f9Z1spKRdlImVETM3b3qRtGRWXee9cH9hEi4U=;
	b=IKPvl5Dqbg+LEeib1B6xTKpHiiCsittUbeB4CKKi2+HFPZrRdEhcJUOiQifummoOvKtJ5/
	jGxkcD9nuOXQoALAMfH7pfLsvNqe0J3B8bpzmmfrgzQLJKvQGHxyc4TQ5IYoXr9pO7xwwH
	MidHXhGx4iAOTsgcZBEFS01GEdaV940=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-_p36ToZzOMyOl86nP76L3Q-1; Mon,
 07 Sep 2026 17:09:53 -0400
X-MC-Unique: _p36ToZzOMyOl86nP76L3Q-1
X-Mimecast-MFC-AGG-ID: _p36ToZzOMyOl86nP76L3Q_1788815391
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D3701801200;
	Mon,  7 Sep 2026 21:09:50 +0000 (UTC)
Received: from [100.91.157.188] (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0FA15B1;
	Mon,  7 Sep 2026 21:09:42 +0000 (UTC)
Message-ID: <fea78e29-a3a8-48d2-9353-48a94d3a1649@redhat.com>
Date: Mon, 7 Sep 2026 23:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] drm/panic: Return from screen_user if display is
 too small
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-8-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: BcoKA_i_rTTPShqTGLsMRN4DWKyP2FF01aq8LvWjajo_1788815391
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_140959_939541_986CEF3A 
X-CRM114-Status: GOOD (  18.46  )
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

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Return an error if the display is too small to display at least a
> single character. If the panic handler cannot display any message
> it does at least not destroy the current output, which might help
> with identifying the problem.
> 
> This change duplicates the logic from screen_kmsg output.

Thanks, it looks good to me.

maybe add a check also for font->height > sb->height

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f597ef04c5bc..c317afc76669 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,7 +486,7 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u
>   	struct drm_rect r_screen, r_logo, r_msg;
>   	unsigned int msg_width, msg_height;
>   
> -	if (!font)
> +	if (!font || font->width > sb->width)
>   		return -EINVAL;
>   
>   	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);


