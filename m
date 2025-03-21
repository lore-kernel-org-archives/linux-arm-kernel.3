Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B1C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FaPMoTNGeH8ohUXRHD1ixUsB8Tp0d1wecl5lHYFkNU=; b=0U1YCpupYxMMNqq/IRZ2VvQ5Dv
	C/mf/TxVg1E2hUNovJ1uE906PklZ4zfFFW671dsNKhSAvwYEXLRL8NepMmN1u/kznyezDILOtQGUX
	R+BrMbANz21Np6asn/X6X4KNC99oLE3V3OneaxakHzVc1XZodEYxse8wAbjbf4brC3mDOP4tslvZ7
	J1I709qwx/MejVndXZHmTT0qNgtDF+Io+JMYHvAfCm/Ye4Sr/fQrKnvboQhWDESa7R6zDcHvFJN1I
	aoC7ZMPuTCCrZynHz2ayvPf/A55no0zr/9NVhSB45tyP2sZr2km+V2OrpiBZ7Aza1lZGeLH9RWBft
	pRJ/W4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfTZ-0000000FYfS-0E5J;
	Fri, 21 Mar 2025 16:44:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfQh-0000000FY1c-10I3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:41:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224341bbc1dso45975945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575266; x=1743180066; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9FaPMoTNGeH8ohUXRHD1ixUsB8Tp0d1wecl5lHYFkNU=;
        b=zSnwD1h/38EciR3SqUEb5cvC9USyxivBZCR/Ez5w6y2a/JFcJ7ortQYPrvd9SA9a1c
         A9T17a3o5ietI2xkReezoAmPG5B8zDRrgZY15tIJlQL9AXCGC9S+MqaLLkjwe1GE0zca
         dYMlvzLQc4ZKrd245EmGYeHsk9lLZt5xAt9G3EtpOnIUBXoCffLyFBqceScWCI46mXD9
         FGwAaVFX2b3XpfGtFwcSEECgz0xPUShUzzM5QUSK96ErJSO6tgkaV9pEF9zo5ilM5VK2
         NKMOIfg1R5+OzvLiTokqwhYuRO4mEFZyGeMI5RgsWKHjSmlNgqGr3jaytPu+f0iDa+rI
         rtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575266; x=1743180066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FaPMoTNGeH8ohUXRHD1ixUsB8Tp0d1wecl5lHYFkNU=;
        b=QSVJCJgn5HZH26HFikTW9M0qC1X4xss7cgjuvrDCYc42lywmoXSX7Y8zfP2GzS+Mtx
         HwAn+i55PmmBJLxtOMNdjbKEloyNVS78BprJnF9Aud+3xCkGy3IdclozubfAck+BnCtd
         UHlBmYo+kMsrNH9IFieszp4MxVgKPdYwd4VPTkyLtB1GMD5X/v9GHYQsmhY2dUu5x7M4
         bNbdXhp+jmfyGGtFXtpoEQWlN4X4NCAAkiTnIyy3bXE338BE3s0evJuiOpa6Ae6d1YXP
         12rjAMk2LTeebiyHDxRfgxU7KZOptx7w/+qzpzSu1HkrZHyzxB3rO1NTHbjNcPn7ISta
         CcJw==
X-Forwarded-Encrypted: i=1; AJvYcCVaR5GabmgPJkuvg6EgY82yzQs+oJ9Dbwl8oxSXBYonOxQQN7UJ9sJupnIWKyl4grKq78r7XYdC6bdcPVFOS28w@lists.infradead.org
X-Gm-Message-State: AOJu0YxGTo3EzRTFvAgVWwG6SGc6hP8O1Tn9YEiZv6DqDGP1am1eNoza
	WW/89P45IR/uqJ/jC1g1xBfiuzHUXEyLX2U7B9orr0ev7bJASFiSQerEMP8iDEMh5eAA77U2ruy
	iJ9+SC29e7IM6zMBWFlez8/eFj9jkXM0eayA5hQ==
X-Gm-Gg: ASbGncvZAP7v48PITv0E2dZ6eUocnm0voSAf4OInPuNrISHqlMuEZpB7ugirC7jt8Go
	FMHJng44a3b+DvqOYUri8TXWSDhtVrq552AmdA6LnLyueEw6ITHMITVp1UhNe0xHC0wwtsJRmW3
	z0tRXf1kX12RX/od8IYWxDJrDK1Ag=
X-Google-Smtp-Source: AGHT+IGpGZv7QPVlqJm7zVCLsooGhrw6FWGfyPFguHfvgX7YH05uiYw0fJOVDVFEFFx3C6Sc2YWTTHkw7pNlgPfHnVk=
X-Received: by 2002:a05:6a00:21cf:b0:736:d6da:8f9e with SMTP id
 d2e1a72fcca58-7390564df47mr6098579b3a.0.1742575266016; Fri, 21 Mar 2025
 09:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250109171956.3535294-1-yeoreum.yun@arm.com> <CAJ9a7ViuVntYL62q=WYPkFR3++cyufPdKUHm0FUAPyGy76pB_A@mail.gmail.com>
 <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
In-Reply-To: <GV1PR08MB10521BB7C93822F5124F2D66EFBD22@GV1PR08MB10521.eurprd08.prod.outlook.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 21 Mar 2025 16:40:53 +0000
X-Gm-Features: AQ5f1JoCtvVwtGKHSe22bJ_CAOESEB84P3ODOa8rwi7b1lfrK1QBbZhPSXQhfG0
Message-ID: <CAJ9a7Vgz+L+UYf8Yqyu9J5hp3AB3WPSKutA4AvR-OFdu8b-dPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] coresight: prevent deactivate active config while
 enabling the config
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, 
	"james.clark@linaro.org" <james.clark@linaro.org>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_094107_279233_C97EB267 
X-CRM114-Status: GOOD (  29.20  )
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

Hi

On Fri, 14 Mar 2025 at 15:25, Yeo Reum Yun <YeoReum.Yun@arm.com> wrote:
>
> Hi, Mike.
>
> > >  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> > > @@ -867,6 +870,28 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
> > >
> > > +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc, bool enable)
> > > +{
> > > +       if (enable)
> > > +               return atomic_inc_not_zero(&config_desc->active_cnt);
> > > +
> >
> > Not sure why we have an "enable" parameter here - it completely
> > changes the meaning of the function - with no comment at the start.
>
> Sorry. But what I intended is to distinguish
>     - activation of config
>     - enable of activated config.
> Because, current coresight doesn't grab the module reference on enable of activate config,
> But It grabs that reference only in activation.
> That's why I used to "enable" parameter to distinguish this
> while I integrate with module_owner count.
>
> > >         list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> > >                 if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> > > -                       atomic_dec(&config_desc->active_cnt);
> > >                         atomic_dec(&cscfg_mgr->sys_active_cnt);
> > > -                       cscfg_owner_put(config_desc->load_owner);
> > > +                       cscfg_config_desc_put(config_desc);
> > >                         dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
> > >                         break;
> > >                 }
> > > @@ -1047,7 +1066,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > >                                      unsigned long cfg_hash, int preset)
> > >  {
> > >         struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> > > -       const struct cscfg_config_desc *config_desc;
> > > +       struct cscfg_config_desc *config_desc;
> > >         unsigned long flags;
> > >         int err = 0;
> > >
> > > @@ -1062,8 +1081,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> > >         raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> > >         list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
> > >                 config_desc = config_csdev_item->config_desc;
> > > -               if ((atomic_read(&config_desc->active_cnt)) &&
> > > -                   ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> > > +               if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> > > +                               cscfg_config_desc_get(config_desc, true)) {
> > >
> > This obfuscates the logic of the comparisons without good reason. With
> > the true parameter, the function does no "get" operation but just
> > replicates the logic being replaced - checking the active_cnt is
> > non-zero.
> >
> > Restore this to the original logic to make it readable again
>
> It's not a replicates of comparsion logic, but if true,

sorry - missed that point .

> It get the reference of active_cnt but not get module reference.
> The fundemental fault in the UAF becase of just "atomic_read()"
> so, it should hold reference in here.
>
> So, If you think the cscfg_config_desc_get()'s parameter makes obfuscation,
> I think there're two way to modfiy.
>
>     1. cscfg_config_desc_get()/put() always grab/drop the module count.
>     2. remove cscfg_config_desc_get()/put() but just use atomic_XXX(&active_cnt) only
>         with cscfg_owner_get()/put()
>
> Any thougt?
>
> Thanks!
>
>

The get and put functions are asymmetrical w.r.t. owner.

The put will put owner if active count decrements to 0,
The get if not on enable path will put owner unconditionally.

This means that the caller has to work out the correct input conditions.

Might be better if:-

get_desc()
{
    if (! desc->refcnt) {
       if (!get_owner())
           return false;
   }
   desc->refcnt++;
    return true;
}

put_desc()
{
   desc->refcnt--;
  if (! desc->refcnt)
    put_owner()
}

and then change the enable_active_cfg matching logic to

if ( (desc->refcnt) && (desc->hash == hash) && get_desc()) {
     < set active cfg>
}



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

